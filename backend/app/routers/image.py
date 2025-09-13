from typing import List

from fastapi import APIRouter

from ..models import Image

router = APIRouter(prefix="/image", tags=["image"])


@router.get("/", response_model=List[Image])
def get_images(image_id: str):
    return []
