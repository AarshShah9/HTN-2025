"""Database models for the image management system.

This module defines the SQLAlchemy models used to store image metadata,
including paths, descriptions, tags, embeddings, and location data.
"""

import uuid
from datetime import datetime
from typing import Any

from sqlalchemy import JSON, Boolean, Column, DateTime, Float, String, Text

from database.database import Base


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
        audio (str): Base64 encoded WAV audio at 44100 sample rate (optional)
        latitude (float): GPS latitude coordinate (optional)
        longitude (float): GPS longitude coordinate (optional)
    """

    __tablename__ = "images"

    # Primary key - UUID stored as string for compatibility
    id = Column(
        String(36),
        primary_key=True,
        default=lambda: str(uuid.uuid4()),
        unique=True,
        nullable=False,
    )

    # Metadata fields
    timestamp = Column(DateTime, default=datetime.utcnow, nullable=False)
    tagged = Column(Boolean, default=False, nullable=False)  # Processing status

    # AI-generated content
    embeddings = Column(JSON, nullable=True)  # Vector embeddings for search
    description = Column(Text, nullable=True)  # Natural language description
    tags = Column(JSON, default=list, nullable=False)  # Descriptive tags array

    # File system reference
    path = Column(String(500), nullable=False)  # Relative path to image file

    # Audio data (optional)
    audio = Column(Text, nullable=True)  # Base64 encoded WAV audio at 44100 sample rate

    # Location data (optional)
    latitude = Column(Float, nullable=True)  # GPS coordinates
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
            int: Number of tags, 0 if tags is None or not a list
        """
        tags_value: Any = self.tags  # JSON column returns arbitrary structure
        if isinstance(tags_value, list):
            return len(tags_value)
        return 0


class VideoModel(Base):
    """SQLAlchemy model for storing video metadata.

    This model stores comprehensive information about videos including:
    - Video frames as base64 strings (60fps)
    - AI-generated descriptions and tags
    - Vector embeddings for semantic search
    - GPS coordinates for location-based features
    - Processing status tracking

    Attributes:
        id (str): Unique UUID identifier for the video
        timestamp (datetime): When the video record was created
        tagged (bool): Whether AI processing has been completed
        embeddings (dict): Vector embeddings for semantic search
        description (str): AI-generated natural language description
        frames (list): List of base64 encoded video frames at 60fps
        tags (list): List of AI-generated descriptive tags
        audio (str): Base64 encoded WAV audio at 44100 sample rate (optional)
        latitude (float): GPS latitude coordinate (optional)
        longitude (float): GPS longitude coordinate (optional)
        fps (int): Frames per second (default: 60)
        duration (float): Video duration in seconds
    """

    __tablename__ = "videos"

    # Primary key - UUID stored as string for compatibility
    id = Column(
        String(36),
        primary_key=True,
        default=lambda: str(uuid.uuid4()),
        unique=True,
        nullable=False,
    )

    # Metadata fields
    timestamp = Column(DateTime, default=datetime.utcnow, nullable=False)
    tagged = Column(Boolean, default=False, nullable=False)  # Processing status

    # AI-generated content
    embeddings = Column(JSON, nullable=True)  # Vector embeddings for search
    description = Column(Text, nullable=True)  # Natural language description
    tags = Column(JSON, default=list, nullable=False)  # Descriptive tags array

    # Video data
    frames = Column(JSON, nullable=False)  # List of base64 encoded frames
    fps = Column(Float, default=60.0, nullable=False)  # Frames per second
    duration = Column(Float, nullable=True)  # Duration in seconds

    # Audio data (optional)
    audio = Column(Text, nullable=True)  # Base64 encoded WAV audio at 44100 sample rate

    # Location data (optional)
    latitude = Column(Float, nullable=True)  # GPS coordinates
    longitude = Column(Float, nullable=True)

    def __repr__(self):
        """String representation of the VideoModel instance.

        Returns:
            str: Human-readable representation showing key fields
        """
        # Avoid direct truthiness or len() on Column objects during type analysis
        frames_value: Any = self.frames
        frame_len = len(frames_value) if isinstance(frames_value, list) else 0
        return f"<VideoModel(id={self.id}, frames={frame_len}, tagged={self.tagged})>"

    @property
    def has_location(self) -> bool:
        """Check if the video has GPS coordinates.

        Returns:
            bool: True if both latitude and longitude are set
        """
        return self.latitude is not None and self.longitude is not None

    @property
    def tag_count(self) -> int:
        """Get the number of tags associated with this video.

        Returns:
            int: Number of tags, 0 if tags is None or not a list
        """
        tags_value: Any = self.tags
        if isinstance(tags_value, list):
            return len(tags_value)
        return 0

    @property
    def frame_count(self) -> int:
        """Get the number of frames in this video.

        Returns:
            int: Number of frames, 0 if frames is None or not a list
        """
        frames_value: Any = self.frames
        if isinstance(frames_value, list):
            return len(frames_value)
        return 0

    @property
    def calculated_duration(self) -> float:
        """Calculate video duration based on frame count and fps.

        Returns:
            float: Duration in seconds
        """
        frames_value: Any = self.frames
        fps_value: Any = self.fps
        if (
            isinstance(frames_value, list)
            and isinstance(fps_value, (int, float))
            and fps_value > 0
        ):
            return len(frames_value) / float(fps_value)
        return 0.0
