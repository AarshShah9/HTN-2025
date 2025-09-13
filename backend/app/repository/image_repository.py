"""Repository layer for image data access operations.

This module provides a clean abstraction layer between the API routes
and the database, implementing the Repository pattern for:
- CRUD operations on image records
- Complex queries and filtering
- Database transaction management
- Data validation and error handling
"""

import sys

sys.path.append("../..")
from datetime import datetime
from typing import List, Optional, Tuple, Union
from uuid import UUID

from database.models import AudioModel, ImageModel
from sqlalchemy import delete, select, update
from sqlalchemy.ext.asyncio import AsyncSession

from ..utils.embedding import calculate_cosine_similarity, generate_text_embedding


class ImageRepository:
    """Repository class for image database operations.

    This class encapsulates all database operations related to images,
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

    async def create_image(
        self,
        path: str,
        description: Optional[str] = None,
        tags: Optional[List[str]] = None,
        embeddings: Optional[dict] = None,
        tagged: bool = False,
        audio_id: Optional[str] = None,
        latitude: Optional[float] = None,
        longitude: Optional[float] = None,
    ) -> ImageModel:
        """Create a new image record in the database.

        Args:
            path: File path to the image (relative to images directory)
            description: Optional natural language description
            tags: List of descriptive tags (defaults to empty list)
            embeddings: Optional vector embeddings for semantic search
            tagged: Whether the image has been processed by AI (default: False)
            audio_id: Optional reference to AudioModel ID
            latitude: Optional GPS latitude coordinate
            longitude: Optional GPS longitude coordinate

        Returns:
            ImageModel: The created image record with generated ID and timestamp

        Raises:
            SQLAlchemyError: If database operation fails
        """
        if tags is None:
            tags = []

        # Create new image model instance
        image = ImageModel(
            path=path,
            description=description,
            tags=tags,
            embeddings=embeddings,
            tagged=tagged,
            audio_id=audio_id,  # Store reference to AudioModel ID
            timestamp=datetime.utcnow(),
            latitude=latitude,
            longitude=longitude,
        )

        # Add to session and commit to database
        self.session.add(image)
        await self.session.commit()
        await self.session.refresh(image)  # Refresh to get generated fields
        return image

    async def get_image_by_id(self, image_id: Union[UUID, str]) -> Optional[ImageModel]:
        """Retrieve an image record by its unique identifier.

        Args:
            image_id: UUID or string representation of the image ID

        Returns:
            ImageModel: The image record if found, None otherwise
        """
        id_str = str(image_id) if isinstance(image_id, UUID) else image_id
        result = await self.session.execute(
            select(ImageModel).where(ImageModel.id == id_str)
        )
        return result.scalar_one_or_none()

    async def get_image_by_path(self, path: str) -> Optional[ImageModel]:
        """Get an image by its path."""
        result = await self.session.execute(
            select(ImageModel).where(ImageModel.path == path)
        )
        return result.scalar_one_or_none()

    async def get_all_images(self, skip: int = 0, limit: int = 100) -> List[ImageModel]:
        """Get all images with pagination."""
        result = await self.session.execute(
            select(ImageModel)
            .order_by(ImageModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def get_tagged_images(
        self, skip: int = 0, limit: int = 100
    ) -> List[ImageModel]:
        """Get all tagged images."""
        result = await self.session.execute(
            select(ImageModel)
            .where(ImageModel.tagged.is_(True))
            .order_by(ImageModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def get_untagged_images(
        self, skip: int = 0, limit: int = 100
    ) -> List[ImageModel]:
        """Get all untagged images."""
        result = await self.session.execute(
            select(ImageModel)
            .where(ImageModel.tagged.is_(False))
            .order_by(ImageModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return list(result.scalars().all())

    async def search_similar_audio_embeddings(
        self, query_embedding: List[float], limit: int = 2
    ) -> List[Tuple[ImageModel, float]]:
        """Find images with audio embeddings most similar to the query embedding.

        Args:
            query_embedding: The embedding vector to compare against
            limit: Maximum number of results to return

        Returns:
            List of tuples containing (image, similarity_score) pairs,
            ordered by similarity (highest first)
        """
        if not query_embedding:
            return []

        # Get all audio records with embeddings and their associated images
        result = await self.session.execute(
            select(ImageModel, AudioModel.embedding)
            .join(AudioModel, ImageModel.audio_id == AudioModel.id)
            .where(AudioModel.embedding.is_not(None))
        )

        # Calculate similarity scores for each audio embedding
        scored_images = []
        for img, audio_embedding in result.all():
            if not audio_embedding:
                continue

            similarity = calculate_cosine_similarity(query_embedding, audio_embedding)
            scored_images.append((img, similarity))

        # Sort by similarity score (highest first) and return top results
        scored_images.sort(key=lambda x: x[1], reverse=True)
        return scored_images[:limit]

    async def get_images_by_audio(
        self, audio_description: str, limit: int = 2
    ) -> List[ImageModel]:
        """Find images with audio transcriptions most similar to the given description.

        Args:
            audio_description: Text description to search for
            limit: Maximum number of results to return

        Returns:
            List of images ordered by audio similarity (most similar first)
        """
        # Generate embedding for the query text
        query_embedding = generate_text_embedding(audio_description)
        if not query_embedding:
            return []

        # Get similar audio embeddings and return corresponding images
        similar_audio = await self.search_similar_audio_embeddings(
            query_embedding=query_embedding, limit=limit
        )

        # Extract just the images (discard similarity scores)
        return [img for img, _ in similar_audio]

    async def search_images_by_tags(
        self, tags: List[str], skip: int = 0, limit: int = 100
    ) -> List[ImageModel]:
        """Search images by tags (contains any of the provided tags)."""
        # Note: This is a simple implementation. For more complex tag searching,
        # you might want to use a different approach or a full-text search engine
        result = await self.session.execute(
            select(ImageModel)
            .order_by(ImageModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )

        all_images = result.scalars().all()
        filtered_images = []

        for image in all_images:
            if image.tags is not None and any(tag in image.tags for tag in tags):
                filtered_images.append(image)

        return filtered_images

    async def update_image(
        self,
        image_id: Union[UUID, str],
        description: Optional[str] = None,
        tags: Optional[List[str]] = None,
        embeddings: Optional[dict] = None,
        tagged: Optional[bool] = None,
        audio_id: Optional[str] = None,
    ) -> Optional[ImageModel]:
        """Update an image record."""
        id_str = str(image_id) if isinstance(image_id, UUID) else image_id
        update_data = {}

        if description is not None:
            update_data["description"] = description
        if tags is not None:
            update_data["tags"] = tags
        if embeddings is not None:
            update_data["embeddings"] = embeddings
        if tagged is not None:
            update_data["tagged"] = tagged
        if audio_id is not None:
            update_data[ImageModel.audio_id] = audio_id

        if not update_data:
            return await self.get_image_by_id(image_id)

        await self.session.execute(
            update(ImageModel).where(ImageModel.id == id_str).values(**update_data)
        )
        await self.session.commit()

        return await self.get_image_by_id(image_id)

    async def delete_image(self, image_id: Union[UUID, str]) -> bool:
        """Delete an image record."""
        id_str = str(image_id) if isinstance(image_id, UUID) else image_id
        result = await self.session.execute(
            delete(ImageModel).where(ImageModel.id == id_str)
        )
        await self.session.commit()
        return result.rowcount > 0

    async def count_images(self) -> int:
        """Count total number of images."""
        result = await self.session.execute(select(ImageModel.id))
        return len(result.scalars().all())

    async def count_tagged_images(self) -> int:
        """Count number of tagged images."""
        result = await self.session.execute(
            select(ImageModel.id).where(ImageModel.tagged.is_(True))
        )
        return len(result.scalars().all())

    async def count_untagged_images(self) -> int:
        """Count number of untagged images."""
        result = await self.session.execute(
            select(ImageModel.id).where(ImageModel.tagged.is_(False))
        )
        return len(result.scalars().all())

    async def get_image_locations(self) -> List[tuple[float, float]]:
        """Get all image locations."""
        result = await self.session.execute(
            select(ImageModel.latitude, ImageModel.longitude)
            .where(ImageModel.latitude.is_not_none())
            .where(ImageModel.longitude.is_not_none())
        )
        return list(result.scalars().all())
