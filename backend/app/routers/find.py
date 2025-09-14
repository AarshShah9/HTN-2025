import os
from database.database import get_db_session
from database.models import ImageModel, VideoModel, AudioModel
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import or_, select
from sqlalchemy.ext.asyncio import AsyncSession
import google.generativeai as genai
from dotenv import load_dotenv

load_dotenv()

# Configure Gemini
genai.configure(api_key=os.environ.get("GOOGLE_API_KEY"))
model = genai.GenerativeModel('gemini-1.5-flash')

router = APIRouter()


@router.get("/find")
async def find_item(query: str, db: AsyncSession = Depends(get_db_session)):
    """
    Searches for an item in the database and returns a natural language response.

    Uses Gemini Flash to generate a conversational one-sentence response about
    where the item was last seen based on the most recent occurrence.

    Args:
        query: The search term (e.g., "keys", "phone", "wallet").
        db: The database session.

    Returns:
        A natural one-sentence response about the item's location.
    """
    # Search for the query in the tags and description of images
    image_stmt = (
        select(ImageModel)
        .where(
            or_(
                ImageModel.tags.contains(query),
                ImageModel.description.ilike(f"%{query}%"),
            )
        )
        .order_by(ImageModel.timestamp.desc())
        .limit(1)
    )

    # Search for the query in the tags and description of videos
    video_stmt = (
        select(VideoModel)
        .where(
            or_(
                VideoModel.tags.contains(query),
                VideoModel.description.ilike(f"%{query}%"),
            )
        )
        .order_by(VideoModel.timestamp.desc())
        .limit(1)
    )

    # Execute both queries
    image_result = await db.execute(image_stmt)
    video_result = await db.execute(video_stmt)

    latest_image = image_result.scalar_one_or_none()
    latest_video = video_result.scalar_one_or_none()

    # Find the most recent between the two
    candidates = []
    if latest_image:
        candidates.append(latest_image)
    if latest_video:
        candidates.append(latest_video)

    most_recent = max(candidates, key=lambda x: x.timestamp) if candidates else None

    if not most_recent:
        raise HTTPException(status_code=404, detail=f"I could not find your {query}.")

    # Gather context information
    description = most_recent.description or "unknown scene"
    tags_list = most_recent.tags if isinstance(most_recent.tags, list) else []
    tags = ", ".join(str(tag) for tag in tags_list) if tags_list else "no specific tags"
    media_type = "photo" if isinstance(most_recent, ImageModel) else "video"
    timestamp = most_recent.timestamp.strftime("%B %d, %Y at %I:%M %p")
    
    # Get location info if available
    location_info = ""
    if most_recent.latitude and most_recent.longitude:
        location_info = f" at coordinates {most_recent.latitude}, {most_recent.longitude}"
    
    # Get audio transcript if available
    audio_info = ""
    if hasattr(most_recent, 'audio_id') and most_recent.audio_id:
        audio_result = await db.execute(
            select(AudioModel.transcription)
            .where(AudioModel.id == most_recent.audio_id)
        )
        audio_transcription = audio_result.scalar_one_or_none()
        if audio_transcription and audio_transcription.strip():
            audio_info = f" Audio captured: '{audio_transcription.strip()}'"

    # Create prompt for Gemini
    prompt = f"""
    You are helping someone find their lost item. Based on the following information about the most recent sighting, 
    generate ONE conversational sentence telling them where their {query} was last seen.

    Item searched for: {query}
    Media type: {media_type}
    Scene description: {description}
    Detected objects/tags: {tags}
    Timestamp: {timestamp}
    Location: {location_info if location_info else "no GPS data"}
    {audio_info}

    Generate a natural, helpful one-sentence response like "I last saw your keys..." or "Your phone was spotted..."
    Be conversational and include the most relevant details (time, location, scene context).
    """

    try:
        response = model.generate_content(
            prompt,
            generation_config=genai.types.GenerationConfig(
                temperature=0.7,
                max_output_tokens=100,
            )
        )
        return {"message": response.text.strip()}
    except Exception as e:
        # Fallback response if Gemini fails
        return {"message": f"I last saw your {query} in a {media_type} from {timestamp} showing {description}."}
