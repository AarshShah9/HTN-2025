from sqlalchemy.ext.asyncio import AsyncSession
from database.database import get_db_session
from app.repository.image_repository import ImageRepository

class RepositoryFactory:
    """Factory class to create repository instances with database session."""
    
    @staticmethod
    async def get_image_repository() -> ImageRepository:
        """Get an ImageRepository instance with a database session."""
        async with get_db_session() as session:
            return ImageRepository(session)
    
    @staticmethod
    def create_image_repository(session: AsyncSession) -> ImageRepository:
        """Create an ImageRepository instance with an existing session."""
        return ImageRepository(session)
