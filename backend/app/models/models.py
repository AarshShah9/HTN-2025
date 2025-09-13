from datetime import datetime
from typing import Any, Dict, List, Optional

from pydantic import BaseModel, ConfigDict, Field


class ImageBase(BaseModel):
    description: Optional[str] = None
    tags: List[str] = Field(default_factory=list)
    embeddings: Optional[Dict[str, Any]] = None
    tagged: bool = False
    audio_id: Optional[str] = Field(
        default=None, description="Reference to AudioModel ID"
    )
    latitude: Optional[float] = Field(default=None, ge=-90, le=90)
    longitude: Optional[float] = Field(default=None, ge=-180, le=180)


class ImageCreate(ImageBase):
    path: str


class ImageUpdate(BaseModel):
    description: Optional[str] = None
    tags: Optional[List[str]] = None
    embeddings: Optional[Dict[str, Any]] = None
    tagged: Optional[bool] = None
    audio_id: Optional[str] = Field(
        default=None, description="Reference to AudioModel ID"
    )
    latitude: Optional[float] = Field(default=None, ge=-90, le=90)
    longitude: Optional[float] = Field(default=None, ge=-180, le=180)


class ImageResponse(ImageBase):
    id: str  # UUID stored as string
    path: str
    timestamp: datetime

    model_config = ConfigDict(from_attributes=True)


class VideoBase(BaseModel):
    description: Optional[str] = None
    tags: List[str] = Field(default_factory=list)
    tagged: bool = False
    fps: float = Field(default=60.0, gt=0)
    duration: Optional[float] = Field(default=None, ge=0)
    audio_id: Optional[str] = Field(
        default=None, description="Reference to AudioModel ID"
    )
    latitude: Optional[float] = Field(default=None, ge=-90, le=90)
    longitude: Optional[float] = Field(default=None, ge=-180, le=180)


class VideoCreate(VideoBase):
    frames: List[str] = Field(
        ..., min_length=1, description="List of base64 encoded video frames"
    ),
    audio: str


class VideoUpdate(BaseModel):
    description: Optional[str] = None
    tags: Optional[List[str]] = None
    tagged: Optional[bool] = None
    fps: Optional[float] = Field(default=None, gt=0)
    duration: Optional[float] = Field(default=None, ge=0)
    audio_id: Optional[str] = Field(
        default=None, description="Reference to AudioModel ID"
    )


class VideoResponse(VideoBase):
    id: str  # UUID stored as string
    frames: List[str]
    timestamp: datetime

    model_config = ConfigDict(from_attributes=True)
