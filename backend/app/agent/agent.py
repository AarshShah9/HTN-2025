"""WebSocket-based chat agent using Google Gemini for conversational AI.

This module provides:
- WebSocket endpoint for real-time chat communication
- Context preparation from image descriptions in the database
- Gemini-powered conversational responses
- Memory management for chat sessions
"""

import asyncio
import json
import os
import sys
from typing import Dict, List, Optional

# Add parent directories to path for imports
from pathlib import Path
sys.path.append(str(Path(__file__).parent.parent.parent))

from database.database import async_session_maker
from database.models import ImageModel, AudioModel, VideoModel
from dotenv import load_dotenv
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
import google.generativeai as genai
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.repository.image_repository import ImageRepository
from app.repository.video_repository import VideoRepository

load_dotenv()


class ChatAgent:
    """WebSocket-based chat agent with Gemini integration."""
    
    def __init__(self):
        """Initialize the chat agent with Gemini client."""
        self.api_key = os.environ.get("GOOGLE_API_KEY")
        if not self.api_key:
            raise ValueError("GOOGLE_API_KEY environment variable is required")
        
        genai.configure(api_key=self.api_key)
        self.model = genai.GenerativeModel('gemini-1.5-flash')
        self.context_cache: Optional[str] = None
        self.chat_history: List[Dict[str, str]] = []
    
    async def prepare_context(self, session: AsyncSession) -> str:
        """Prepare comprehensive context from all image data in the database.
        
        Args:
            session: Database session for querying images
            
        Returns:
            Formatted context string containing all structured image information
        """
        if self.context_cache:
            return self.context_cache
            
        image_repo = ImageRepository(session)
        video_repo = VideoRepository(session)
        
        # Get limited images and videos to stay within token limits
        all_images = await image_repo.get_all_images(limit=300)
        all_videos = await video_repo.get_all_videos(limit=200)
        
        context_parts = [
            "=== PHOTO & VIDEO COLLECTION ASSISTANT ===",
            "",
            "You are an AI assistant with complete access to a user's comprehensive photo and video collection database.",
            "You have detailed information about every image and video including AI-generated descriptions, detected objects,",
            "location data, audio transcriptions, and timestamps. Use ALL of this information to answer ANY query.",
            "",
            "TAGS represent detected objects, people, places, activities, and concepts in images/videos:",
            "- Objects: car, tree, building, furniture, animals, food items",
            "- People: person, child, adult, groups, faces",
            "- Places: park, street, indoor, outdoor, specific locations, landmarks", 
            "- Activities: walking, eating, playing, sports, events",
            "- Concepts: weather conditions, colors, emotions, time of day",
            ""
        ]
        
        # Add statistics for both images and videos
        tagged_images = [img for img in all_images if img.tagged]
        tagged_videos = [vid for vid in all_videos if vid.tagged]
        images_with_location = [img for img in all_images if img.latitude and img.longitude]
        videos_with_location = [vid for vid in all_videos if vid.latitude and vid.longitude]
        images_with_audio = []
        videos_with_audio = []
        
        for image in all_images:
            if hasattr(image, 'audio_id') and image.audio_id:
                audio_result = await session.execute(
                    select(AudioModel.transcription)
                    .where(AudioModel.id == image.audio_id)
                )
                if audio_result.scalar_one_or_none():
                    images_with_audio.append(image)
        
        for video in all_videos:
            if hasattr(video, 'audio_id') and video.audio_id:
                audio_result = await session.execute(
                    select(AudioModel.transcription)
                    .where(AudioModel.id == video.audio_id)
                )
                if audio_result.scalar_one_or_none():
                    videos_with_audio.append(video)
        
        context_parts.extend([
            f"COLLECTION OVERVIEW:",
            f"• Total Images: {len(all_images)}",
            f"• Total Videos: {len(all_videos)}",
            f"• AI-Analyzed Images: {len(tagged_images)}",
            f"• AI-Analyzed Videos: {len(tagged_videos)}",
            f"• Images with GPS Location: {len(images_with_location)}",
            f"• Videos with GPS Location: {len(videos_with_location)}",
            f"• Images with Audio: {len(images_with_audio)}",
            f"• Videos with Audio: {len(videos_with_audio)}",
            "",
            "DETAILED MEDIA DATA:",
            ""
        ])
        
        # Add detailed information for every 10th image to reduce context size
        for i, image in enumerate(all_images, 1):
            if i % 2 != 0:  # Skip to every 10th image
                continue
            image_info = [f"IMAGE #{i}:"]
            
            # Add timestamp first for chronological context
            if image.timestamp:
                image_info.append(f"TIMESTAMP: {image.timestamp}")
            
            # Add AI description
            if image.description:
                image_info.append(f"DESCRIPTION: {image.description}")
            else:
                image_info.append(f"DESCRIPTION: [Not yet analyzed by AI]")
            
            # Add detected tags/objects
            if image.tags and len(image.tags) > 0:
                image_info.append(f"TAGS: {', '.join(image.tags)}")
            
            # Add location information (only if exists)
            if image.latitude and image.longitude:
                image_info.append(f"GPS: {image.latitude}, {image.longitude}")
            
            # Add audio transcription (only if exists and not empty)
            if hasattr(image, 'audio_id') and image.audio_id:
                audio_result = await session.execute(
                    select(AudioModel.transcription)
                    .where(AudioModel.id == image.audio_id)
                )
                audio_transcription = audio_result.scalar_one_or_none()
                if audio_transcription and audio_transcription.strip():
                    image_info.append(f"AUDIO: \"{audio_transcription.strip()}\"")
            # Skip audio section if no meaningful audio data
            
            # Add processing status
            status = "Fully Analyzed" if image.tagged else "Pending AI Analysis"
            image_info.append(f"STATUS: {status}")
            
            context_parts.extend(image_info)
            context_parts.append("")  # Empty line between images
        
        # Add detailed information for every 10th video to reduce context size
        for i, video in enumerate(all_videos, 1):
            if i % 2 != 0:  # Skip to every 10th video
                continue
            
            # Add timestamp first for chronological context
            if video.timestamp:
                video_info.append(f"TIMESTAMP: {video.timestamp}")
            
            # Add video metadata
            if hasattr(video, 'fps') and video.fps:
                video_info.append(f"FPS: {video.fps}")
            if hasattr(video, 'duration') and video.duration:
                video_info.append(f"DURATION: {video.duration}s")
            
            # Add detected tags/objects
            if video.tags and len(video.tags) > 0:
                video_info.append(f"TAGS: {', '.join(video.tags)}")
            
            # Add location information (only if exists)
            if video.latitude and video.longitude:
                video_info.append(f"GPS: {video.latitude}, {video.longitude}")
            
            # Add audio transcription (only if exists and not empty)
            if hasattr(video, 'audio_id') and video.audio_id:
                audio_result = await session.execute(
                    select(AudioModel.transcription)
                    .where(AudioModel.id == video.audio_id)
                )
                audio_transcription = audio_result.scalar_one_or_none()
                if audio_transcription and audio_transcription.strip():
                    video_info.append(f"AUDIO: \"{audio_transcription.strip()}\"")
            
            # Add processing status
            status = "Fully Analyzed" if video.tagged else "Pending AI Analysis"
            video_info.append(f"STATUS: {status}")
            
            context_parts.extend(video_info)
            context_parts.append("")  # Empty line between videos
        
        context_parts.extend([
            "",
            "Answer queries using descriptions, tags, GPS coordinates, timestamps, and audio transcripts.",
            "Reference specific image/video numbers. Be conversational and helpful."
        ])
        
        self.context_cache = "\n".join(context_parts)
        return self.context_cache
    
    async def generate_response(self, user_message: str, context: str) -> str:
        """Generate a response using Gemini with context and chat history.
        
        Args:
            user_message: The user's message
            context: Prepared context about images
            
        Returns:
            Generated response from Gemini
        """
        # Build conversation prompt with context and history
        conversation_prompt = [context, "\nConversation History:"]
        
        # Add recent chat history (last 10 exchanges)
        for exchange in self.chat_history[-10:]:
            conversation_prompt.append(f"User: {exchange['user']}")
            conversation_prompt.append(f"Assistant: {exchange['assistant']}")
        
        # Add current user message
        conversation_prompt.append(f"\nUser: {user_message}\nAssistant:")
        
        full_prompt = "\n".join(conversation_prompt)
        
        try:
            response = self.model.generate_content(
                full_prompt,
                generation_config=genai.types.GenerationConfig(
                    temperature=0.7,
                    max_output_tokens=2048,
                )
            )
            
            assistant_response = response.text.strip()
            
            # Store in chat history
            self.chat_history.append({
                "user": user_message,
                "assistant": assistant_response
            })
            
            return assistant_response
            
        except Exception as e:
            return f"I'm sorry, I encountered an error: {str(e)}"
    
    def clear_context_cache(self):
        """Clear the context cache to force refresh on next request."""
        self.context_cache = None


# Global chat agent instance
chat_agent = ChatAgent()


async def handle_websocket_chat(websocket: WebSocket):
    """Handle WebSocket chat communication.
    
    Args:
        websocket: WebSocket connection for real-time communication
    """
    await websocket.accept()
    
    try:
        # Prepare context when connection is established
        async with async_session_maker() as session:
            context = await chat_agent.prepare_context(session)
        
        # Send welcome message
        welcome_msg = {
            "type": "system",
            "message": "Connected! I have access to your image collection and can help you with questions about your photos."
        }
        await websocket.send_text(json.dumps(welcome_msg))
        
        while True:
            # Receive message from client
            data = await websocket.receive_text()
            
            try:
                message_data = json.loads(data)
                user_message = message_data.get("message", "").strip()
                
                if not user_message:
                    continue
                
                # Generate response
                response = await chat_agent.generate_response(user_message, context)
                
                # Send response back to client
                response_msg = {
                    "type": "assistant",
                    "message": response
                }
                await websocket.send_text(json.dumps(response_msg))
                
            except json.JSONDecodeError:
                error_msg = {
                    "type": "error",
                    "message": "Invalid JSON format. Please send messages as JSON with 'message' field."
                }
                await websocket.send_text(json.dumps(error_msg))
                
    except WebSocketDisconnect:
        print("WebSocket client disconnected")
    except Exception as e:
        print(f"WebSocket error: {e}")
        try:
            error_msg = {
                "type": "error", 
                "message": f"Connection error: {str(e)}"
            }
            await websocket.send_text(json.dumps(error_msg))
        except:
            pass


# FastAPI app for the agent service
app = FastAPI(title="Chat Agent", description="WebSocket-based chat agent with image context")


@app.websocket("/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    """WebSocket endpoint for chat communication."""
    await handle_websocket_chat(websocket)


@app.get("/")
async def root():
    """Root endpoint for the chat agent service."""
    return {
        "message": "Chat Agent Service", 
        "websocket_endpoint": "/chat",
        "status": "active"
    }


@app.post("/refresh-context")
async def refresh_context():
    """Refresh the image context cache."""
    chat_agent.clear_context_cache()
    return {"message": "Context cache cleared and will be refreshed on next chat"}


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8120)