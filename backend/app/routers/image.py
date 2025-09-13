import json
import os
import uuid
from datetime import datetime

from fastapi import APIRouter

from ..models.models import Image

router = APIRouter(prefix="/image", tags=["image"])


@router.post("/upload")
async def upload_image(base64_data: str, description: str = ""):
    # Generate unique ID
    image_id = str(uuid.uuid4())

    # Define filename and filepath
    filename = f"{image_id}.b64"
    filepath = os.path.join("images", filename)

    # Save base64 data to file
    with open(filepath, "w") as f:
        f.write(base64_data)

    # Create image metadata
    created_at = datetime.now().isoformat()
    image = Image(
        id=image_id,
        url=filepath,
        description=description,
        created_at=created_at,
        tags=[],
    )

    # Load existing metadata
    metadata_path = "images/metadata.json"
    if os.path.exists(metadata_path):
        with open(metadata_path, "r") as f:
            metadata = json.load(f)
    else:
        metadata = []

    # Append new image
    metadata.append(image.dict())

    # Save metadata
    with open(metadata_path, "w") as f:
        json.dump(metadata, f, indent=4)

    return image


@router.get("/images_by_audio")
def get_images_by_audio(audio_description: str):
    """
    Search for images based on audio description.
    This endpoint matches the audio description against image descriptions and tags.
    """
    ...
