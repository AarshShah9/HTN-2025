#!/usr/bin/env python3
"""
Script to randomly delete 20% of images from the database.
Uses direct SQLAlchemy operations to avoid import dependencies.
"""

import asyncio
import sys
import random
from pathlib import Path

# Add the backend directory to the Python path
backend_dir = Path(__file__).parent
sys.path.insert(0, str(backend_dir))

from database.database import get_db_session
from database.models import ImageModel
from sqlalchemy import delete
from sqlalchemy.future import select


async def delete_random_images():
    """Delete 20% of images randomly from the database."""
    
    DELETION_PERCENTAGE = 0.20
    
    print(f"Starting to delete {DELETION_PERCENTAGE * 100}% of images randomly...")
    
    # Get database session
    async for session in get_db_session():
        try:
            # Get all image IDs
            print("Fetching all image IDs...")
            result = await session.execute(select(ImageModel.id))
            all_image_ids = [row[0] for row in result.all()]
            
            total_images = len(all_image_ids)
            print(f"Found {total_images} total images in database")
            
            if total_images == 0:
                print("No images found in database. Nothing to delete.")
                return
            
            # Calculate how many to delete (20%)
            images_to_delete_count = int(total_images * DELETION_PERCENTAGE)
            print(f"Will delete {images_to_delete_count} images ({DELETION_PERCENTAGE * 100}%)")
            
            if images_to_delete_count == 0:
                print("Calculated 0 images to delete. Database has too few images.")
                return
            
            # Randomly select images to delete
            images_to_delete = random.sample(all_image_ids, images_to_delete_count)
            print(f"Randomly selected {len(images_to_delete)} images for deletion")
            
            # Confirm deletion
            print(f"\n⚠️  WARNING: This will permanently delete {len(images_to_delete)} images!")
            print("Image IDs to be deleted:", images_to_delete[:10], "..." if len(images_to_delete) > 10 else "")
            
            # Delete the selected images
            print("Proceeding with deletion...")
            result = await session.execute(
                delete(ImageModel)
                .where(ImageModel.id.in_(images_to_delete))
            )
            
            deleted_count = result.rowcount
            print(f"Successfully deleted {deleted_count} images")
            
            # Commit the changes
            await session.commit()
            
            # Get final count for summary
            final_result = await session.execute(select(ImageModel.id))
            remaining_images = len(list(final_result.scalars().all()))
            
            print(f"\nSummary:")
            print(f"- Images before deletion: {total_images}")
            print(f"- Images deleted: {deleted_count}")
            print(f"- Images remaining: {remaining_images}")
            print(f"- Deletion percentage: {(deleted_count / total_images) * 100:.1f}%")
            print("✅ Random image deletion completed!")
            
        except Exception as e:
            print(f"Error occurred: {str(e)}")
            await session.rollback()
            raise
        finally:
            # Session will be automatically closed by the context manager
            break


if __name__ == "__main__":
    asyncio.run(delete_random_images())
