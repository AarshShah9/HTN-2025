from sqlalchemy import Column, String, Boolean, DateTime, JSON, Text
from database.database import Base
from datetime import datetime
import uuid

class ImageModel(Base):
    __tablename__ = "images"
    
    id = Column(String(36), primary_key=True, default=lambda: str(uuid.uuid4()), unique=True, nullable=False)
    timestamp = Column(DateTime, default=datetime.utcnow, nullable=False)
    tagged = Column(Boolean, default=False, nullable=False)
    embeddings = Column(JSON, nullable=True)  # JSONB equivalent in SQLite
    description = Column(Text, nullable=True)
    path = Column(String(500), nullable=False)  # Relative path to images
    tags = Column(JSON, default=list, nullable=False)  # String array stored as JSON
    latitude = Column(Float, nullable=True)
    longitude = Column(Float, nullable=True)
    
    def __repr__(self):
        return f"<ImageModel(id={self.id}, path={self.path}, tagged={self.tagged})>"
