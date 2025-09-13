import asyncio
from app.repository.image_repository import ImageRepository
from app.utils.tagging import get_image_tags_batch_as_parts
from database.database import async_session_maker


async def fire_image_tagging_worker():
    """Worker that tags images every 15 seconds."""
    while True:
        print("Worker running - 15 second interval")
        
        try:
            # Get database session
            async with async_session_maker() as session:
                repository = ImageRepository(session)
                
                # Get all untagged images from the database
                untagged_images = await repository.get_untagged_images(limit=10)  # Process in batches
                
                if untagged_images:
                    print(f"Found {len(untagged_images)} untagged images to process")
                    
                    # Extract image paths for batch processing
                    image_paths = [image.path for image in untagged_images]
                    
                    # Run image tagging on them
                    tagging_results = get_image_tags_batch_as_parts(image_paths)
                    
                    if "error" not in tagging_results:
                        # Process results and update database
                        batch_results = tagging_results.get("batch_results", [])
                        
                        for i, result in enumerate(batch_results):
                            if i < len(untagged_images):
                                image = untagged_images[i]
                                
                                # Extract tags and description from result
                                tags = result.get("tags", [])
                                description = result.get("description", "")
                                
                                # Update the image in database
                                await repository.update_image(
                                    image_id=image.id,
                                    tags=tags,
                                    description=description,
                                    tagged=True
                                )
                        
                        print(f"Successfully tagged {len(batch_results)} images")
                    else:
                        print(f"Error in tagging: {tagging_results['error']}")
                else:
                    print("No untagged images found")
                    
        except Exception as e:
            print(f"Error in background worker: {e}")

        await asyncio.sleep(15)
