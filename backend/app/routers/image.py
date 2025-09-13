import uuid
from datetime import datetime
from typing import List

from fastapi import APIRouter, File, HTTPException, UploadFile

from ..config import supabase
from ..models import Image

router = APIRouter(prefix="/image", tags=["image"])


@router.get("/", response_model=List[Image])
def get_images():
    response = supabase.table("images").select("*").execute()
    return [Image(**item) for item in response.data]


@router.post("/upload", response_model=Image)
async def upload_image(file: UploadFile = File(...), description: str = ""):
    try:
        if not file.content_type or not file.content_type.startswith("image/"):
            raise HTTPException(status_code=400, detail="File must be an image")

        file_id = str(uuid.uuid4())
        file_path = f"{file_id}_{file.filename}"

        # Read file content
        file_content = await file.read()

        # Upload to bucket
        supabase.storage.from_("images").upload(
            path=file_path,
            file=file_content,
            file_options={"cache-control": "3600", "upsert": "false"},
        )

        # Get public url
        public_url = supabase.storage.from_("images").get_public_url(file_path)

        # Insert into table
        image_data = {
            "id": file_id,
            "url": public_url,
            "description": description,
            "created_at": datetime.utcnow().isoformat(),
        }

        supabase.table("images").insert(image_data).execute()

        return Image(**image_data)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@router.get("/images_by_audio")
def get_images_by_audio(audio_description: str):
    """
    Search for images based on audio description.
    This endpoint matches the audio description against image descriptions and tags.
    """
    ...
