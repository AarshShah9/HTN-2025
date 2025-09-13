"""Database models for the image management system.

This module defines the SQLAlchemy models used to store image metadata,
including paths, descriptions, tags, embeddings, and location data.
"""

from sqlalchemy import Column, String, Boolean, DateTime, JSON, Text, Float
from database.database import Base
from datetime import datetime
import uuid

class ImageModel(Base):
    """SQLAlchemy model for storing image metadata.
    
    This model stores comprehensive information about images including:
    - File system paths
    - AI-generated descriptions and tags
    - Vector embeddings for semantic search
    - GPS coordinates for location-based features
    - Processing status tracking
    
    Attributes:
        id (str): Unique UUID identifier for the image
        timestamp (datetime): When the image record was created
        tagged (bool): Whether AI processing has been completed
        embeddings (dict): Vector embeddings for semantic search
        description (str): AI-generated natural language description
        path (str): Relative file path to the image file
        tags (list): List of AI-generated descriptive tags
        latitude (float): GPS latitude coordinate (optional)
        longitude (float): GPS longitude coordinate (optional)
    """
    __tablename__ = "images"
    
    # Primary key - UUID stored as string for compatibility
    id = Column(String(36), primary_key=True, default=lambda: str(uuid.uuid4()), unique=True, nullable=False)
    
    # Metadata fields
    timestamp = Column(DateTime, default=datetime.utcnow, nullable=False)
    tagged = Column(Boolean, default=False, nullable=False)  # Processing status
    
    # AI-generated content
    embeddings = Column(JSON, nullable=True)  # Vector embeddings for search
    description = Column(Text, nullable=True)  # Natural language description
    tags = Column(JSON, default=list, nullable=False)  # Descriptive tags array
    
    # File system reference
    path = Column(String(500), nullable=False)  # Relative path to image file
    
    # Location data (optional)
    latitude = Column(Float, nullable=True)   # GPS coordinates
    longitude = Column(Float, nullable=True)
    
    def __repr__(self):
        """String representation of the ImageModel instance.
        
        Returns:
            str: Human-readable representation showing key fields
        """
        return f"<ImageModel(id={self.id}, path={self.path}, tagged={self.tagged})>"
    
    @property
    def has_location(self) -> bool:
        """Check if the image has GPS coordinates.
        
        Returns:
            bool: True if both latitude and longitude are set
        """
        return self.latitude is not None and self.longitude is not None
    
    @property
    def tag_count(self) -> int:
        """Get the number of tags associated with this image.
        
        Returns:
            int: Number of tags, 0 if tags is None or empty
        """
        return len(self.tags) if self.tags else 0
