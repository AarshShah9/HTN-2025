from typing import List, Optional
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.models.models import ImageCreate, ImageUpdate, ImageResponse
from app.repository.image_repository import ImageRepository
from database.database import get_db_session

router = APIRouter(prefix="/api/images", tags=["images"])

def get_image_repository(session: AsyncSession = Depends(get_db_session)) -> ImageRepository:
    return ImageRepository(session)

@router.post("/", response_model=ImageResponse, status_code=status.HTTP_201_CREATED)
async def create_image(
    image_data: ImageCreate,
    repository: ImageRepository = Depends(get_image_repository)
):
    """Create a new image record."""
    try:
        image = await repository.create_image(
            path=image_data.path,
            description=image_data.description,
            tags=image_data.tags,
            embeddings=image_data.embeddings,
            tagged=image_data.tagged
        )
        return ImageResponse.from_orm(image)
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Failed to create image: {str(e)}"
        )

@router.get("/{image_id}", response_model=ImageResponse)
async def get_image(
    image_id: str,
    repository: ImageRepository = Depends(get_image_repository)
):
    """Get an image by ID."""
    image = await repository.get_image_by_id(image_id)
    if not image:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Image not found"
        )
    return ImageResponse.from_orm(image)

@router.get("/", response_model=List[ImageResponse])
async def get_images(
    skip: int = 0,
    limit: int = 100,
    tagged_only: Optional[bool] = None,
    repository: ImageRepository = Depends(get_image_repository)
):
    """Get all images with optional filtering."""
    if tagged_only is True:
        images = await repository.get_tagged_images(skip=skip, limit=limit)
    elif tagged_only is False:
        images = await repository.get_untagged_images(skip=skip, limit=limit)
    else:
        images = await repository.get_all_images(skip=skip, limit=limit)
    
    return [ImageResponse.from_orm(image) for image in images]

@router.get("/search/by-tags", response_model=List[ImageResponse])
async def search_images_by_tags(
    tags: str,  # Comma-separated tags
    skip: int = 0,
    limit: int = 100,
    repository: ImageRepository = Depends(get_image_repository)
):
    """Search images by tags."""
    tag_list = [tag.strip() for tag in tags.split(",") if tag.strip()]
    if not tag_list:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="At least one tag must be provided"
        )
    
    images = await repository.search_images_by_tags(tag_list, skip=skip, limit=limit)
    return [ImageResponse.from_orm(image) for image in images]

@router.put("/{image_id}", response_model=ImageResponse)
async def update_image(
    image_id: str,
    image_update: ImageUpdate,
    repository: ImageRepository = Depends(get_image_repository)
):
    """Update an image record."""
    updated_image = await repository.update_image(
        image_id=image_id,
        description=image_update.description,
        tags=image_update.tags,
        embeddings=image_update.embeddings,
        tagged=image_update.tagged
    )
    
    if not updated_image:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Image not found"
        )
    
    return ImageResponse.from_orm(updated_image)

@router.delete("/{image_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_image(
    image_id: str,
    repository: ImageRepository = Depends(get_image_repository)
):
    """Delete an image record."""
    deleted = await repository.delete_image(image_id)
    if not deleted:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Image not found"
        )

@router.get("/stats/counts")
async def get_image_stats(
    repository: ImageRepository = Depends(get_image_repository)
):
    """Get image statistics."""
    total = await repository.count_images()
    tagged = await repository.count_tagged_images()
    untagged = await repository.count_untagged_images()
    
    return {
        "total_images": total,
        "tagged_images": tagged,
        "untagged_images": untagged
    }
