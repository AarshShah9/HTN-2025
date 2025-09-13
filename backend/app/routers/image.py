from datetime import datetime
from typing import List
from uuid import uuid4

from fastapi import APIRouter, HTTPException

from ..config import supabase
from ..models import Task, TaskCreate

router = APIRouter(prefix="/image", tags=["image"])


@router.get("/", response_model=List[Image])
def get_images(user_id: str):
    return []
