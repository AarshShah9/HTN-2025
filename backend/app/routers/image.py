import base64
import json
import os
import uuid
from datetime import datetime
from typing import List

from fastapi import APIRouter, HTTPException

from ..models import Image

router = APIRouter(prefix="/image", tags=["image"])

IMAGES_DIR = os.path.join(os.path.dirname(__file__), "..", "..", "images")
METADATA_FILE = os.path.join(IMAGES_DIR, "metadata.json")

# Ensure directories exist
os.makedirs(IMAGES_DIR, exist_ok=True)
if not os.path.exists(METADATA_FILE):
    with open(METADATA_FILE, "w") as f:
        json.dump([], f)


@router.get("/", response_model=List[Image])
def get_images():
    with open(METADATA_FILE, "r") as f:
        data = json.load(f)
    return [Image(**item) for item in data]


@router.post("/upload")
async def upload_image(base64_data: str, description: str = ""):
    try:
        file_id = str(uuid.uuid4())

        if base64_data.startswith("data:image/"):
            header, data = base64_data.split(",", 1)
            mime = header.split(";")[0].split(":")[1]
            ext = mime.split("/")[1]
            file_content = base64.b64decode(data)
        else:
            file_content = base64.b64decode(base64_data)
            ext = "jpg"

        file_path = f"{file_id}.{ext}"
        full_path = os.path.join(IMAGES_DIR, file_path)

        # Save to local folder
        with open(full_path, "wb") as f:
            f.write(file_content)

        # Store metadata
        image_data = {
            "id": file_id,
            "url": f"/images/{file_path}",
            "description": description,
            "created_at": datetime.utcnow().isoformat(),
            "tags": [],
        }

        # Read existing metadata
        with open(METADATA_FILE, "r") as f:
            data = json.load(f)

        # Append new image
        data.append(image_data)

        # Write back
        with open(METADATA_FILE, "w") as f:
            json.dump(data, f, indent=2)

        return image_data
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
