from typing import List, Optional, Union
from uuid import UUID
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select
from sqlalchemy import update, delete
from database.models import ImageModel
from datetime import datetime

class ImageRepository:
    def __init__(self, session: AsyncSession):
        self.session = session
    
    async def create_image(
        self,
        path: str,
        description: Optional[str] = None,
        tags: Optional[List[str]] = None,
        embeddings: Optional[dict] = None,
        tagged: bool = False
    ) -> ImageModel:
        """Create a new image record."""
        if tags is None:
            tags = []
        
        image = ImageModel(
            path=path,
            description=description,
            tags=tags,
            embeddings=embeddings,
            tagged=tagged,
            timestamp=datetime.utcnow()
        )
        
        self.session.add(image)
        await self.session.commit()
        await self.session.refresh(image)
        return image
    
    async def get_image_by_id(self, image_id: Union[UUID, str]) -> Optional[ImageModel]:
        """Get an image by its ID."""
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
        return result.scalars().all()
    
    async def get_tagged_images(self, skip: int = 0, limit: int = 100) -> List[ImageModel]:
        """Get all tagged images."""
        result = await self.session.execute(
            select(ImageModel)
            .where(ImageModel.tagged == True)
            .order_by(ImageModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return result.scalars().all()
    
    async def get_untagged_images(self, skip: int = 0, limit: int = 100) -> List[ImageModel]:
        """Get all untagged images."""
        result = await self.session.execute(
            select(ImageModel)
            .where(ImageModel.tagged == False)
            .order_by(ImageModel.timestamp.desc())
            .offset(skip)
            .limit(limit)
        )
        return result.scalars().all()
    
    async def search_images_by_tags(self, tags: List[str], skip: int = 0, limit: int = 100) -> List[ImageModel]:
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
            if image.tags and any(tag in image.tags for tag in tags):
                filtered_images.append(image)
        
        return filtered_images
    
    async def update_image(
        self,
        image_id: Union[UUID, str],
        description: Optional[str] = None,
        tags: Optional[List[str]] = None,
        embeddings: Optional[dict] = None,
        tagged: Optional[bool] = None
    ) -> Optional[ImageModel]:
        """Update an image record."""
        id_str = str(image_id) if isinstance(image_id, UUID) else image_id
        update_data = {}
        
        if description is not None:
            update_data[ImageModel.description] = description
        if tags is not None:
            update_data[ImageModel.tags] = tags
        if embeddings is not None:
            update_data[ImageModel.embeddings] = embeddings
        if tagged is not None:
            update_data[ImageModel.tagged] = tagged
        
        if not update_data:
            return await self.get_image_by_id(image_id)
        
        await self.session.execute(
            update(ImageModel)
            .where(ImageModel.id == id_str)
            .values(**update_data)
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
        result = await self.session.execute(
            select(ImageModel.id)
        )
        return len(result.scalars().all())
    
    async def count_tagged_images(self) -> int:
        """Count number of tagged images."""
        result = await self.session.execute(
            select(ImageModel.id).where(ImageModel.tagged == True)
        )
        return len(result.scalars().all())
    
    async def count_untagged_images(self) -> int:
        """Count number of untagged images."""
        result = await self.session.execute(
            select(ImageModel.id).where(ImageModel.tagged == False)
        )
        return len(result.scalars().all())
