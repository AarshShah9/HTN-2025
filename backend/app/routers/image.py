"""Image upload and processing router.

This module handles image upload functionality, including:
- Base64 image data processing
- File system storage management
- Database record creation
-    db: AsyncSession = Depends(get_db_session),Audio-based image search (placeholder)
"""

import base64
import os
import uuid
from typing import List, Optional

from database.database import get_db_session
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.models.models import ImageResponse, ImageUpdate
from app.repository.audio_repository import AudioRepository
from app.repository.image_repository import ImageRepository

from ..utils.transcription import transcribe_audio_from_bytes

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


def get_audio_repository(
    session: AsyncSession = Depends(get_db_session),
) -> AudioRepository:
    """Dependency function to provide AudioRepository instance.

    Args:
        session: Database session from dependency injection

    Returns:
        AudioRepository: Repository instance for audio operations
    """
    return AudioRepository(session)


@router.post("/upload", response_model=ImageResponse)
async def upload_image(
    frames: list[str],
    audio: str,
    latitude: Optional[float] = None,
    longitude: Optional[float] = None,
    repository: ImageRepository = Depends(get_image_repository),
    audio_repository: AudioRepository = Depends(get_audio_repository),
):
    """Upload an image from base64 encoded data.

    This endpoint accepts base64 encoded image data, saves it to the file system,
    and creates a corresponding database record. The image is initially untagged
    and can be processed later by AI services.

    Args:
        frames: Base64 encoded image data as string
        audio: Base64 encoded WAV audio to be transcribed and stored separately
        latitude: Optional GPS latitude coordinate
        longitude: Optional GPS longitude coordinate
        repository: Image repository for database operations
        audio_repository: Audio repository for database operations

    Returns:
        ImageResponse: Created image record with metadata

    Raises:
        HTTPException: If file saving or database operation fails
    """
    # Process audio transcription - audio is required
    if not audio or audio.strip() == "":
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Audio data is required"
        )

    try:
        # Decode base64 audio to bytes
        audio_bytes = base64.b64decode(audio)
        # Transcribe audio using the transcription utility
        transcription = transcribe_audio_from_bytes(audio_bytes, "audio.wav")
        # Create audio record in database
        audio_record = await audio_repository.create_audio(transcription=transcription)
        audio_id = str(audio_record.id)
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Failed to process audio: {str(e)}",
        )

    if not frames:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="No image data provided"
        )

    # Generate unique ID for the image
    image_record = None
    for image in frames:
        image_id = str(uuid.uuid4())

        # Define filename and filepath for storage
        filename = f"{image_id}.b64"
        filepath = os.path.join("images", filename)

        # Ensure images directory exists
        os.makedirs("images", exist_ok=True)

        # Save base64 data to file system
        with open(filepath, "w") as f:
            f.write(image)

        # Create image record in database with initial metadata
        image_record = await repository.create_image(
            path=filename,  # Store relative path to the file
            description=None,  # No description initially
            tags=[],  # Empty tags initially
            embeddings=None,  # No embeddings initially
            tagged=False,  # Not processed by AI yet
            audio_id=audio_id,  # Reference to AudioModel ID
            latitude=latitude,
            longitude=longitude,
        )

    # Return the created image record as response model
    if image_record is None:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Failed to create image record",
        )
    return ImageResponse.model_validate(image_record)


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
    return ImageResponse.model_validate(image)


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

    return [ImageResponse.model_validate(image) for image in images]


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
    return [ImageResponse.model_validate(image) for image in images]


@router.get("/images_by_audio")
async def get_images_by_audio(
    audio_description: str, limit: int = 2, db: AsyncSession = Depends(get_db_session)
):
    """Search for images based on audio description using semantic similarity.

    This endpoint takes a text description (typically from an audio transcription)
    and finds images whose associated audio transcriptions are semantically
    similar to the input text using vector embeddings.

    Args:
        audio_description: Text description derived from audio transcription
        limit: Maximum number of results to return (default: 2)

    Returns:
        List[schemas.Image]: List of images with audio transcriptions most similar
                             to the input description, ordered by similarity

    Example:
        GET /api/images_by_audio?audio_description=a%20dog%20barking%20loudly
    """
    if not audio_description.strip():
        raise HTTPException(status_code=400, detail="Audio description cannot be empty")

    # Get images with similar audio embeddings
    repo = ImageRepository(db)
    images = await repo.get_images_by_audio(
        audio_description=audio_description,
        limit=min(limit, 10),  # Cap limit at 10 for performance
    )

    return [ImageResponse.model_validate(img) for img in images]


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
        audio_id=image_update.audio_id,
    )

    if not updated_image:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Image not found"
        )

    return ImageResponse.model_validate(updated_image)


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
