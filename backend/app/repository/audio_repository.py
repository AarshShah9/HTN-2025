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

from ..utils.embedding import calculate_cosine_similarity, generate_text_embedding


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
            AudioModel: The created audio record with generated ID, timestamp, and embedding

        Raises:
            SQLAlchemyError: If database operation fails
        """
        # Generate embedding from transcription if available
        embedding = None
        if transcription and transcription.strip():
            embedding = generate_text_embedding(transcription)

        # Create new audio model instance
        audio = AudioModel(
            transcription=transcription,
            embedding=embedding,
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

    async def search_audio_by_similarity(
        self, query_text: str, threshold: float = 0.7, limit: int = 10
    ) -> List[tuple[AudioModel, float]]:
        """Search audio records by embedding similarity to query text.

        Args:
            query_text: Text to search for similar audio transcriptions
            threshold: Minimum similarity score (0.0 to 1.0)
            limit: Maximum number of results to return

        Returns:
            List[tuple[AudioModel, float]]: List of (audio_record, similarity_score) tuples
                                           sorted by similarity score (highest first)
        """
        # Generate embedding for the query text
        query_embedding = generate_text_embedding(query_text)
        if not query_embedding:
            return []

        # Get all audio records that have embeddings
        result = await self.session.execute(
            select(AudioModel)
            .where(AudioModel.embedding.is_not(None))
            .where(AudioModel.transcription.is_not(None))
            .where(AudioModel.transcription != "")
        )
        audio_records = list(result.scalars().all())

        # Calculate similarity scores
        similarities = []
        for audio in audio_records:
            if audio.embedding is not None and isinstance(audio.embedding, list):
                similarity = calculate_cosine_similarity(
                    query_embedding, audio.embedding
                )
                if similarity >= threshold:
                    similarities.append((audio, similarity))

        # Sort by similarity score (highest first) and limit results
        similarities.sort(key=lambda x: x[1], reverse=True)
        return similarities[:limit]

    async def get_images_by_audio_similarity(
        self, query_text: str, threshold: float = 0.7, limit: int = 10
    ) -> List[str]:
        """Get image IDs that are associated with audio similar to the query text.

        Args:
            query_text: Text to search for similar audio transcriptions
            threshold: Minimum similarity score (0.0 to 1.0)
            limit: Maximum number of results to return

        Returns:
            List[str]: List of image IDs associated with similar audio
        """
        # Get similar audio records
        similar_audio = await self.search_audio_by_similarity(
            query_text, threshold, limit
        )

        # Extract audio IDs
        audio_ids = [audio.id for audio, _ in similar_audio]

        if not audio_ids:
            return []

        # Import here to avoid circular imports
        from database.models import ImageModel

        # Find images that reference these audio IDs
        result = await self.session.execute(
            select(ImageModel.id).where(ImageModel.audio_id.in_(audio_ids))
        )

        return [image_id for image_id in result.scalars().all()]

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
            # Generate new embedding when transcription is updated
            if transcription.strip():
                embedding = generate_text_embedding(transcription)
                update_data[AudioModel.embedding] = embedding
            else:
                update_data[AudioModel.embedding] = None

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
            select(AudioModel).order_by(AudioModel.timestamp.desc()).limit(limit)
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
