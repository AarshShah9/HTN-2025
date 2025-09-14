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

from app.models.models import ImageInput, ImageResponse, ImageUpdate
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


@router.post("/")
async def upload_image(
    data: ImageInput,
    repository: ImageRepository = Depends(get_image_repository),
    audio_repository: AudioRepository = Depends(get_audio_repository),
) -> ImageResponse:
    """Upload an image from base64 encoded data.

    This endpoint accepts base64 encoded image data, saves it to the file system,
    and creates corresponding database records (one per frame). The image(s) are
    initially untagged and can be processed later by AI services.

    Args:
        data: ImageInput model containing:
            - frames: List[str] of base64-encoded image data
            - audio: Base64 encoded WAV audio to be transcribed and stored separately
            - latitude: Optional GPS latitude coordinate
            - longitude: Optional GPS longitude coordinate
        repository: Image repository for database operations.
        audio_repository: Audio repository for database operations.

    Returns:
        ImageResponse: Created image record with metadata.

    Raises:
        HTTPException: If file saving, audio processing, or database operations fail.
    """


    try:

        transcription = data.transcript

        audio_record = await audio_repository.create_audio(transcription=transcription)
        audio_id = str(audio_record.id)
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Failed to process audio: {str(e)}",
        )

    if not data.frames:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="No image data provided"
        )

    image_record = None
    for image in data.frames:
        image_id = str(uuid.uuid4())

        filename = f"{image_id}.b64"
        filepath = os.path.join("images", filename)

        os.makedirs("images", exist_ok=True)

        # Save base64 data to file system
        with open(filepath, "w") as f:
            f.write(image)

        # Create image record in database with initial metadata
        image_record = await repository.create_image(
            path=filename,
            description=None,  # No description initially
            tags=[],  # Empty tags initially
            embeddings=None,  # No embeddings initially
            tagged=False,  # Not processed by AI yet
            audio_id=audio_id,  # Reference to AudioModel ID
            latitude=data.latitude,
            longitude=data.longitude,
        )

    if image_record is None:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Failed to create image record",
        )
    return ImageResponse.model_validate(image_record)


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


@router.get("/images_by_transcript")
async def get_images_by_transcript(
    transcript: str, limit: int = 50, db: AsyncSession = Depends(get_db_session)
):
    """Search for images based on transcription using semantic similarity.

    This endpoint takes a text description (typically from an audio transcription)
    and finds images whose associated audio transcriptions are semantically
    similar to the input text using vector embeddings.

    Args:
        transcript: Text description derived from audio transcription
        limit: Maximum number of results to return (default: 50)

    Returns:
        List[schemas.Image]: List of images with audio transcriptions most similar to the input description, ordered by similarity

    Example:
        GET /api/images_by_audio?audio_description=a%20dog%20barking%20loudly
    """
    if not transcript.strip():
        raise HTTPException(status_code=400, detail="Audio transcript cannot be empty")

    # Get images with similar audio embeddings
    repo = ImageRepository(db)
    images = await repo.get_images_by_audio(
        audio_description=transcript,
        limit=min(limit, 50),  # Cap limit at 50 for performance
    )

    return [ImageResponse.model_validate(img) for img in images]


@router.get("/{image_id}", response_model=ImageResponse)
async def get_image_by_id(
    image_id: str, repository: ImageRepository = Depends(get_image_repository)
):
    """Get an image by ID."""
    image = await repository.get_image_by_id(image_id)
    if not image:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Image not found"
        )
    return ImageResponse.model_validate(image)


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
