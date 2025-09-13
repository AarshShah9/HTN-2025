from pydantic import BaseModel, Field
from typing import List, Optional, Dict, Any
from datetime import datetime

class ImageBase(BaseModel):
    description: Optional[str] = None
    tags: List[str] = Field(default_factory=list)
    embeddings: Optional[Dict[str, Any]] = None
    tagged: bool = False

class ImageCreate(ImageBase):
    path: str

class ImageUpdate(BaseModel):
    description: Optional[str] = None
    tags: Optional[List[str]] = None
    embeddings: Optional[Dict[str, Any]] = None
    tagged: Optional[bool] = None

class ImageResponse(ImageBase):
    id: str  # UUID stored as string
    path: str
    timestamp: datetime
    
    class Config:
        from_attributes = True
