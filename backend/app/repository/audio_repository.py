"""Repository layer for audio data access operations.

This module provides a clean abstraction layer between the API routes
and the database, implementing the Repository pattern for:
- CRUD operations on audio transcription records
- Complex queries and filtering
- Database transaction management
- Data validation and error handling
"""

import sys
from datetime import datetime
from typing import List, Optional, Union
from uuid import UUID

sys.path.append("../..")
from database.models import AudioModel
from sqlalchemy import delete, update
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select


class AudioRepository:
    """Repository class for audio database operations.

    This class encapsulates all database operations related to audio transcriptions,
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

    async def create_audio(
        self,
        transcription: Optional[str] = None,
    ) -> AudioModel:
        """Create a new audio transcription record in the database.

        Args:
            transcription: Natural language transcription text

        Returns:
            AudioModel: The created audio record with generated ID and timestamp

        Raises:
            SQLAlchemyError: If database operation fails
        """
        # Create new audio model instance
        audio = AudioModel(
            transcription=transcription,
            timestamp=datetime.utcnow(),
        )

        # Add to session and commit to database
        self.session.add(audio)
        await self.session.commit()
        await self.session.refresh(audio)  # Refresh to get generated fields
        return audio

    async def get_audio_by_id(self, audio_id: Union[UUID, str]) -> Optional[AudioModel]:
        """Retrieve an audio record by its unique identifier.

        Args:
            audio_id: UUID or string representation of the audio ID

        Returns:
            AudioModel: The audio record if found, None otherwise
        """
        id_str = str(audio_id) if isinstance(audio_id, UUID) else audio_id
        result = await self.session.execute(
            select(AudioModel).where(AudioModel.id == id_str)
        )
        return result.scalar_one_or_none()

    async def get_all_audio(self, skip: int = 0, limit: int = 100) -> List[AudioModel]:
        """Get all audio records with pagination.

        Args:
            skip: Number of records to skip (for pagination)
            limit: Maximum number of records to return

        Returns:
            List[AudioModel]: List of audio records ordered by timestamp (newest first)
        """
        result = await self.session.execute(
            select(AudioModel)
            .order_by(AudioModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def search_audio_by_transcription(
        self, search_term: str, skip: int = 0, limit: int = 100
    ) -> List[AudioModel]:
        """Search audio records by transcription content.

        Args:
            search_term: Text to search for in transcriptions
            skip: Number of records to skip (for pagination)
            limit: Maximum number of records to return

        Returns:
            List[AudioModel]: List of audio records containing the search term
        """
        result = await self.session.execute(
            select(AudioModel)
            .where(AudioModel.transcription.contains(search_term))
            .order_by(AudioModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def update_audio(
        self,
        audio_id: Union[UUID, str],
        transcription: Optional[str] = None,
    ) -> Optional[AudioModel]:
        """Update an audio transcription record.

        Args:
            audio_id: UUID or string representation of the audio ID
            transcription: Updated transcription text

        Returns:
            AudioModel: The updated audio record if found, None otherwise
        """
        id_str = str(audio_id) if isinstance(audio_id, UUID) else audio_id
        update_data = {}

        if transcription is not None:
            update_data[AudioModel.transcription] = transcription

        if not update_data:
            return await self.get_audio_by_id(audio_id)

        await self.session.execute(
            update(AudioModel).where(AudioModel.id == id_str).values(**update_data)
        )
        await self.session.commit()

        return await self.get_audio_by_id(audio_id)

    async def delete_audio(self, audio_id: Union[UUID, str]) -> bool:
        """Delete an audio transcription record.

        Args:
            audio_id: UUID or string representation of the audio ID

        Returns:
            bool: True if the record was deleted, False if not found
        """
        id_str = str(audio_id) if isinstance(audio_id, UUID) else audio_id
        result = await self.session.execute(
            delete(AudioModel).where(AudioModel.id == id_str)
        )
        await self.session.commit()
        return result.rowcount > 0

    async def count_audio(self) -> int:
        """Count total number of audio records.

        Returns:
            int: Total number of audio transcription records
        """
        result = await self.session.execute(select(AudioModel.id))
        return len(result.scalars().all())

    async def get_recent_audio(self, limit: int = 10) -> List[AudioModel]:
        """Get the most recent audio transcription records.

        Args:
            limit: Maximum number of records to return

        Returns:
            List[AudioModel]: List of most recent audio records
        """
        result = await self.session.execute(
            select(AudioModel)
            .order_by(AudioModel.timestamp.desc())
            .limit(limit)
        )
        return list(result.scalars().all())

    async def get_audio_with_transcription(
        self, skip: int = 0, limit: int = 100
    ) -> List[AudioModel]:
        """Get all audio records that have transcription text.

        Args:
            skip: Number of records to skip (for pagination)
            limit: Maximum number of records to return

        Returns:
            List[AudioModel]: List of audio records with non-null transcription
        """
        result = await self.session.execute(
            select(AudioModel)
            .where(AudioModel.transcription.is_not(None))
            .where(AudioModel.transcription != "")
            .order_by(AudioModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def get_audio_without_transcription(
        self, skip: int = 0, limit: int = 100
    ) -> List[AudioModel]:
        """Get all audio records that don't have transcription text.

        Args:
            skip: Number of records to skip (for pagination)
            limit: Maximum number of records to return

        Returns:
            List[AudioModel]: List of audio records with null or empty transcription
        """
        result = await self.session.execute(
            select(AudioModel)
            .where(
                (AudioModel.transcription.is_(None)) | (AudioModel.transcription == "")
            )
            .order_by(AudioModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())