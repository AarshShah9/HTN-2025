#!/usr/bin/env python3
"""
Script to populate fake GPS coordinates for all existing memories (images and videos).
Uses the same number (43.7) for both latitude and longitude as requested.
"""

import asyncio
import sys
from pathlib import Path

# Add the backend directory to the Python path
backend_dir = Path(__file__).parent
sys.path.insert(0, str(backend_dir))

from database.database import get_db_session
from app.repository.image_repository import ImageRepository
from app.repository.video_repository import VideoRepository


async def populate_fake_coordinates():
    """Populate fake GPS coordinates for all existing images and videos."""
    
    # Use the same number for both latitude and longitude
    FAKE_COORDINATE = 43.7
    
    print(f"Starting to populate fake coordinates ({FAKE_COORDINATE}, {FAKE_COORDINATE}) for all memories...")
    
    # Get database session
    async for session in get_db_session():
        try:
            # Initialize repositories
            image_repo = ImageRepository(session)
            video_repo = VideoRepository(session)
            
            # Get all images
            print("Fetching all images...")
            all_images = await image_repo.get_all_images(skip=0, limit=10000)  # Large limit to get all
            print(f"Found {len(all_images)} images")
            
            # Update each image with fake coordinates
            updated_images = 0
            for image in all_images:
                if image.latitude is None or image.longitude is None:
                    await image_repo.update_image(
                        image_id=image.id,
                        latitude=FAKE_COORDINATE,
                        longitude=FAKE_COORDINATE
                    )
                    updated_images += 1
                    print(f"Updated image {image.id} with fake coordinates")
            
            print(f"Updated {updated_images} images with fake coordinates")
            
            # Get all videos
            print("Fetching all videos...")
            all_videos = await video_repo.get_all_videos(skip=0, limit=10000)  # Large limit to get all
            print(f"Found {len(all_videos)} videos")
            
            # Update each video with fake coordinates
            updated_videos = 0
            for video in all_videos:
                if video.latitude is None or video.longitude is None:
                    await video_repo.update_video(
                        video_id=video.id,
                        latitude=FAKE_COORDINATE,
                        longitude=FAKE_COORDINATE
                    )
                    updated_videos += 1
                    print(f"Updated video {video.id} with fake coordinates")
            
            print(f"Updated {updated_videos} videos with fake coordinates")
            
            print(f"\nSummary:")
            print(f"- Total images: {len(all_images)}")
            print(f"- Images updated: {updated_images}")
            print(f"- Total videos: {len(all_videos)}")
            print(f"- Videos updated: {updated_videos}")
            print(f"- Fake coordinates used: ({FAKE_COORDINATE}, {FAKE_COORDINATE})")
            
        except Exception as e:
            print(f"Error occurred: {str(e)}")
            raise
        finally:
            # Session will be automatically closed by the context manager
            break


if __name__ == "__main__":
    asyncio.run(populate_fake_coordinates())
