"""Image upload and processing router.

This module handles image upload functionality, including:
- Base64 image data processing
- File system storage management
- Database record creation
- Audio-based image search (placeholder)
"""

import os
import uuid
from typing import List, Optional

from database.database import get_db_session
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from ..models.models import ImageResponse, ImageUpdate
from ..repository.image_repository import ImageRepository

# Create router with image-specific prefix and tags
router = APIRouter(prefix="/image", tags=["image"])


def get_image_repository(
    session: AsyncSession = Depends(get_db_session),
) -> ImageRepository:
    """Dependency function to provide ImageRepository instance.

    Args:
        session: Database session from dependency injection

    Returns:
        ImageRepository: Repository instance for image operations
    """
    return ImageRepository(session)


@router.post("/upload", response_model=ImageResponse)
async def upload_image(
    base64_data: str,
    audio: Optional[str] = None,
    repository: ImageRepository = Depends(get_image_repository),
):
    """Upload an image from base64 encoded data.

    This endpoint accepts base64 encoded image data, saves it to the file system,
    and creates a corresponding database record. The image is initially untagged
    and can be processed later by AI services.

    Args:
        base64_data: Base64 encoded image data as string
        audio: Optional base64 encoded WAV audio to be transcribed
        repository: Image repository for database operations

    Returns:
        ImageResponse: Created image record with metadata

    Raises:
        HTTPException: If file saving or database operation fails
    """
    # Generate unique ID for the image
    image_id = str(uuid.uuid4())

    # Define filename and filepath for storage
    filename = f"{image_id}.b64"
    filepath = os.path.join("images", filename)

    # Ensure images directory exists
    os.makedirs("images", exist_ok=True)

    # Save base64 data to file system
    with open(filepath, "w") as f:
        f.write(base64_data)

    # Create image record in database with initial metadata
    image_record = await repository.create_image(
        path=filename,  # Store relative path to the file
        description=None,  # No description initially
        tags=[],  # Empty tags initially
        embeddings=None,  # No embeddings initially
        tagged=False,  # Not processed by AI yet
        audio=audio,  # Optional base64 encoded WAV audio
    )

    # Return the created image record as response model
    return ImageResponse.from_orm(image_record)


@router.get("/{image_id}", response_model=ImageResponse)
async def get_image(
    image_id: str, repository: ImageRepository = Depends(get_image_repository)
):
    """Get an image by ID."""
    image = await repository.get_image_by_id(image_id)
    if not image:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Image not found"
        )
    return ImageResponse.from_orm(image)


@router.get("/", response_model=List[ImageResponse])
async def get_images(
    skip: int = 0,
    limit: int = 100,
    tagged_only: Optional[bool] = None,
    repository: ImageRepository = Depends(get_image_repository),
):
    """Get all images with optional filtering."""
    if tagged_only is True:
        images = await repository.get_tagged_images(skip=skip, limit=limit)
    elif tagged_only is False:
        images = await repository.get_untagged_images(skip=skip, limit=limit)
    else:
        images = await repository.get_all_images(skip=skip, limit=limit)

    return [ImageResponse.from_orm(image) for image in images]


@router.get("/search/by-tags", response_model=List[ImageResponse])
async def search_images_by_tags(
    tags: str,  # Comma-separated tags
    skip: int = 0,
    limit: int = 100,
    repository: ImageRepository = Depends(get_image_repository),
):
    """Search images by tags."""
    tag_list = [tag.strip() for tag in tags.split(",") if tag.strip()]
    if not tag_list:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="At least one tag must be provided",
        )

    images = await repository.search_images_by_tags(tag_list, skip=skip, limit=limit)
    return [ImageResponse.from_orm(image) for image in images]


@router.get("/images_by_audio")
def get_images_by_audio(audio_description: str):
    """Search for images based on audio description.

    This endpoint is designed to accept audio transcriptions and match them
    against image descriptions and tags for semantic search functionality.
    Currently a placeholder for future implementation.

    Args:
        audio_description: Text description derived from audio transcription

    Returns:
        dict: Search results or placeholder response

    Note:
        This endpoint is not yet implemented. Future implementation should:
        1. Process the audio description text
        2. Generate embeddings for semantic search
        3. Match against image descriptions and tags
        4. Return ranked search results
    """
    return {
        "message": "Audio-based image search not yet implemented",
        "query": audio_description,
        "status": "placeholder",
    }


@router.put("/{image_id}", response_model=ImageResponse)
async def update_image(
    image_id: str,
    image_update: ImageUpdate,
    repository: ImageRepository = Depends(get_image_repository),
):
    """Update an image record."""
    updated_image = await repository.update_image(
        image_id=image_id,
        description=image_update.description,
        tags=image_update.tags,
        embeddings=image_update.embeddings,
        tagged=image_update.tagged,
    )

    if not updated_image:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Image not found"
        )

    return ImageResponse.from_orm(updated_image)


@router.delete("/{image_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_image(
    image_id: str, repository: ImageRepository = Depends(get_image_repository)
):
    """Delete an image record."""
    deleted = await repository.delete_image(image_id)
    if not deleted:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Image not found"
        )


@router.get("/stats/counts")
async def get_image_stats(repository: ImageRepository = Depends(get_image_repository)):
    """Get image statistics."""
    total = await repository.count_images()
    tagged = await repository.count_tagged_images()
    untagged = await repository.count_untagged_images()

    return {"total_images": total, "tagged_images": tagged, "untagged_images": untagged}


@router.get("/stats/locations")
async def get_image_locations(
    repository: ImageRepository = Depends(get_image_repository),
):
    """
    Get image locations.
    """
    locations = await repository.get_image_locations()
    return locations
