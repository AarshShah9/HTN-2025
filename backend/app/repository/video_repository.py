"""Repository layer for video data access operations.

This module provides a clean abstraction layer between the API routes
and the database, implementing the Repository pattern for:
- CRUD operations on video records
- Complex queries and filtering
- Database transaction management
- Data validation and error handling
"""

import sys

sys.path.append("../..")
from datetime import datetime
from typing import List, Optional, Union, cast
from uuid import UUID

from database.models import VideoModel
from sqlalchemy import delete, update
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select


class VideoRepository:
    """Repository class for video database operations.

    This class encapsulates all database operations related to videos,
    providing a clean interface for the service layer while handling
    database-specific concerns like transactions and error handling.

    Attributes:
        session: Async SQLAlchemy session for database operations
    """

    def __init__(self, session: AsyncSession):
        """Initialize the repository with a database session.

        Args:
            session: Async SQLAlchemy session for database operations
        """
        self.session = session

    async def create_video(
        self,
        frames: List[str],
        tagged: bool = False,
        tags: Optional[List[str]] = None,
        fps: float = 30.0,
        duration: Optional[float] = None,
        audio_id: Optional[str] = None,
        latitude: Optional[float] = None,
        longitude: Optional[float] = None,
    ) -> VideoModel:
        """Create a new video record in the database.

        Args:
            frames: List of base64 encoded video frames
            description: Optional natural language description
            tags: List of descriptive tags (defaults to empty list)
            tagged: Whether the video has been processed by AI (default: False)
            fps: Frames per second (default: 60.0)
            duration: Optional video duration in seconds
            audio_id: Optional reference to AudioModel ID
            latitude: Optional GPS latitude coordinate
            longitude: Optional GPS longitude coordinate

        Returns:
            VideoModel: The created video record with generated ID and timestamp

        Raises:
            SQLAlchemyError: If database operation fails
        """
        if tags is None:
            tags = []

        # Calculate duration if not provided
        if duration is None and frames and fps > 0:
            duration = len(frames) / fps

        # Create new video model instance
        video = VideoModel(
            frames=frames,
            tags=tags,
            tagged=tagged,
            fps=fps,
            duration=duration,
            audio_id=audio_id,
            timestamp=datetime.utcnow(),
            latitude=latitude,
            longitude=longitude,
        )

        # Add to session and commit to database
        self.session.add(video)
        await self.session.commit()
        await self.session.refresh(video)  # Refresh to get generated fields
        return video

    async def get_video_by_id(self, video_id: Union[UUID, str]) -> Optional[VideoModel]:
        """Retrieve a video record by its unique identifier.

        Args:
            video_id: UUID or string representation of the video ID

        Returns:
            VideoModel: The video record if found, None otherwise
        """
        id_str = str(video_id) if isinstance(video_id, UUID) else video_id
        result = await self.session.execute(
            select(VideoModel).where(VideoModel.id == id_str)
        )
        return result.scalar_one_or_none()

    async def get_all_videos(self, skip: int = 0, limit: int = 100) -> List[VideoModel]:
        """Get all videos with pagination."""
        result = await self.session.execute(
            select(VideoModel)
            .order_by(VideoModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def get_tagged_videos(
        self, skip: int = 0, limit: int = 100
    ) -> List[VideoModel]:
        """Get all tagged videos."""
        result = await self.session.execute(
            select(VideoModel)
            .where(VideoModel.tagged.is_(True))
            .order_by(VideoModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def get_untagged_videos(
        self, skip: int = 0, limit: int = 100
    ) -> List[VideoModel]:
        """Get all untagged videos."""
        result = await self.session.execute(
            select(VideoModel)
            .where(VideoModel.tagged.is_(False))
            .order_by(VideoModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def search_videos_by_tags(
        self, tags: List[str], skip: int = 0, limit: int = 100
    ) -> List[VideoModel]:
        """Search videos by tags (contains any of the provided tags)."""
        result = await self.session.execute(
            select(VideoModel)
            .order_by(VideoModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )

        all_videos = list(result.scalars().all())
        filtered_videos = []

        for video in all_videos:
            if video.tags is not None and any(tag in video.tags for tag in tags):
                filtered_videos.append(video)

        return filtered_videos

    async def update_video(
        self,
        video_id: Union[UUID, str],
        description: Optional[str] = None,
        tags: Optional[List[str]] = None,
        embeddings: Optional[dict] = None,
        tagged: Optional[bool] = None,
        fps: Optional[float] = None,
        duration: Optional[float] = None,
        audio: Optional[str] = None,
        latitude: Optional[float] = None,
        longitude: Optional[float] = None,
    ) -> Optional[VideoModel]:
        """Update a video record."""
        id_str = str(video_id) if isinstance(video_id, UUID) else video_id
        update_data = {}

        if description is not None:
            update_data[VideoModel.description] = description
        if tags is not None:
            update_data[VideoModel.tags] = tags
        if embeddings is not None:
            update_data[VideoModel.embeddings] = embeddings
        if tagged is not None:
            update_data[VideoModel.tagged] = tagged
        if fps is not None:
            update_data[VideoModel.fps] = fps
        if duration is not None:
            update_data[VideoModel.duration] = duration
        if audio is not None:
            update_data[VideoModel.audio] = audio
        if latitude is not None:
            update_data[VideoModel.latitude] = latitude
        if longitude is not None:
            update_data[VideoModel.longitude] = longitude

        if not update_data:
            return await self.get_video_by_id(video_id)

        await self.session.execute(
            update(VideoModel).where(VideoModel.id == id_str).values(**update_data)
        )
        await self.session.commit()

        return await self.get_video_by_id(video_id)

    async def delete_video(self, video_id: Union[UUID, str]) -> bool:
        """Delete a video record."""
        id_str = str(video_id) if isinstance(video_id, UUID) else video_id
        result = await self.session.execute(
            delete(VideoModel).where(VideoModel.id == id_str)
        )
        await self.session.commit()
        return result.rowcount > 0

    async def count_videos(self) -> int:
        """Count total number of videos."""
        result = await self.session.execute(select(VideoModel.id))
        return len(list(result.scalars().all()))

    async def count_tagged_videos(self) -> int:
        """Count number of tagged videos."""
        result = await self.session.execute(
            select(VideoModel.id).where(VideoModel.tagged.is_(True))
        )
        return len(list(result.scalars().all()))

    async def count_untagged_videos(self) -> int:
        """Count number of untagged videos."""
        result = await self.session.execute(
            select(VideoModel.id).where(VideoModel.tagged.is_(False))
        )
        return len(list(result.scalars().all()))

    async def get_video_locations(self) -> List[dict]:
        """Get all unique video locations with coordinates.

        Returns:
            List[dict]: List of dictionaries with id, latitude, and longitude
        """
        result = await self.session.execute(
            select(
                VideoModel.id,
                VideoModel.latitude,
                VideoModel.longitude,
            )
            .where(VideoModel.latitude.isnot(None))
            .where(VideoModel.longitude.isnot(None))
        )
        return [
            {"id": row[0], "latitude": row[1], "longitude": row[2]} for row in result.all()
        ]

    async def get_video_by_audio_id(self, audio_id: str) -> Optional[VideoModel]:
        """Get a video by its associated audio ID.

        Args:
            audio_id: The ID of the associated audio

        Returns:
            Optional[VideoModel]: The video if found, None otherwise
        """
        result = await self.session.execute(
            select(VideoModel).where(VideoModel.audio_id == audio_id)
        )
        return result.scalar_one_or_none()

    async def get_videos_by_duration_range(
        self,
        min_duration: Optional[float] = None,
        max_duration: Optional[float] = None,
        skip: int = 0,
        limit: int = 100,
    ) -> List[VideoModel]:
        """Get videos within a specific duration range."""
        query = select(VideoModel)

        if min_duration is not None:
            query = query.where(VideoModel.duration >= min_duration)
        if max_duration is not None:
            query = query.where(VideoModel.duration <= max_duration)

        query = query.order_by(VideoModel.timestamp.desc()).offset(skip).limit(limit)

        result = await self.session.execute(query)
        return list(result.scalars().all())

    async def get_videos_by_frame_count_range(
        self,
        min_frames: Optional[int] = None,
        max_frames: Optional[int] = None,
        skip: int = 0,
        limit: int = 100,
    ) -> List[VideoModel]:
        """Get videos within a specific frame count range."""
        result = await self.session.execute(
            select(VideoModel)
            .order_by(VideoModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )

        all_videos = list(result.scalars().all())
        filtered_videos = []

        for video in all_videos:
            frame_count = (
                len(cast(List[str], video.frames)) if video.frames is not None else 0
            )
            if (min_frames is None or frame_count >= min_frames) and (
                max_frames is None or frame_count <= max_frames
            ):
                filtered_videos.append(video)

        return filtered_videos
