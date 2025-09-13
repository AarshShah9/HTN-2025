import os
import uuid

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from ..models.models import ImageResponse
from ..repository.image_repository import ImageRepository
from database.database import get_db_session

router = APIRouter(prefix="/image", tags=["image"])


def get_image_repository(session: AsyncSession = Depends(get_db_session)) -> ImageRepository:
    return ImageRepository(session)

@router.post("/upload", response_model=ImageResponse)
async def upload_image(
    base64_data: str, 
    repository: ImageRepository = Depends(get_image_repository)
):
    # Generate unique ID
    image_id = str(uuid.uuid4())

    # Define filename and filepath
    filename = f"{image_id}.b64"
    filepath = os.path.join("images", filename)

    # Save base64 data to file
    with open(filepath, "w") as f:
        f.write(base64_data)

    # Create image record in database
    image_record = await repository.create_image(
        path=filename,  # Store relative path to the file
        description=None,
        tags=[],  # Empty tags initially
        embeddings=None,  # No embeddings initially
        tagged=False  # Not tagged initially
    )
    
    # Return the created image record
    return ImageResponse.from_orm(image_record)

@router.get("/images_by_audio")
def get_images_by_audio(audio_description: str):
    """
    Search for images based on audio description.
    This endpoint matches the audio description against image descriptions and tags.
    """
    ...
