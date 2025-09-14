#!/usr/bin/env python3
"""
Simple script to populate fake GPS coordinates for all existing memories.
Uses direct SQLAlchemy operations to avoid import dependencies.
"""

import asyncio
import sys
from pathlib import Path

# Add the backend directory to the Python path
backend_dir = Path(__file__).parent
sys.path.insert(0, str(backend_dir))

from database.database import get_db_session
from database.models import ImageModel, VideoModel
from sqlalchemy import update
from sqlalchemy.future import select


async def populate_fake_coordinates():
    """Populate fake GPS coordinates for all existing images and videos."""
    
    # Use coordinates (43.474000, -80.554000) for latitude and longitude
    FAKE_LATITUDE = 43.474000
    FAKE_LONGITUDE = -80.554000
    
    print(f"Starting to populate fake coordinates ({FAKE_LONGITUDE}, {FAKE_LATITUDE}) for all memories...")
    
    # Get database session
    async for session in get_db_session():
        try:
            # Update images without coordinates
            print("Updating images without coordinates...")
            
            # Get all images to update coordinates
            result = await session.execute(select(ImageModel.id))
            image_ids_to_update = [row[0] for row in result.all()]
            print(f"Found {len(image_ids_to_update)} images to update")
            
            # Update all images with new coordinates
            if image_ids_to_update:
                await session.execute(
                    update(ImageModel)
                    .where(ImageModel.id.in_(image_ids_to_update))
                    .values(latitude=FAKE_LATITUDE, longitude=FAKE_LONGITUDE)
                )
                print(f"Updated {len(image_ids_to_update)} images with coordinates ({FAKE_LONGITUDE}, {FAKE_LATITUDE})")
            
            # Update videos with coordinates
            print("Updating videos with coordinates...")
            
            # Get all videos to update coordinates
            result = await session.execute(select(VideoModel.id))
            video_ids_to_update = [row[0] for row in result.all()]
            print(f"Found {len(video_ids_to_update)} videos to update")
            
            # Update all videos with new coordinates
            if video_ids_to_update:
                await session.execute(
                    update(VideoModel)
                    .where(VideoModel.id.in_(video_ids_to_update))
                    .values(latitude=FAKE_LATITUDE, longitude=FAKE_LONGITUDE)
                )
                print(f"Updated {len(video_ids_to_update)} videos with coordinates ({FAKE_LONGITUDE}, {FAKE_LATITUDE})")
            
            # Commit all changes
            await session.commit()
            
            # Get total counts for summary
            total_images_result = await session.execute(select(ImageModel.id))
            total_images = len(list(total_images_result.scalars().all()))
            
            total_videos_result = await session.execute(select(VideoModel.id))
            total_videos = len(list(total_videos_result.scalars().all()))
            
            print(f"\nSummary:")
            print(f"- Total images in database: {total_images}")
            print(f"- Images updated with coordinates: {len(image_ids_to_update)}")
            print(f"- Total videos in database: {total_videos}")
            print(f"- Videos updated with coordinates: {len(video_ids_to_update)}")
            print(f"- Fake coordinates used: ({FAKE_LONGITUDE}, {FAKE_LATITUDE})")
            print("✅ All memories now have GPS coordinates!")
            
        except Exception as e:
            print(f"Error occurred: {str(e)}")
            await session.rollback()
            raise
        finally:
            # Session will be automatically closed by the context manager
            break


if __name__ == "__main__":
    asyncio.run(populate_fake_coordinates())
