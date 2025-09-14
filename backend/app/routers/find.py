from database.database import get_db_session
from database.models import ImageModel, VideoModel
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import or_, select
from sqlalchemy.ext.asyncio import AsyncSession

router = APIRouter()


@router.get("/find")
async def find_item(query: str, db: AsyncSession = Depends(get_db_session)):
    """
    Searches for an item in the database by a query string.

    The query string is searched against the tags and descriptions of both
    images and videos. The most recent match is returned.

    Args:
        query: The search term.
        db: The database session.

    Returns:
        A message describing the last time the item was seen.
    """
    # Search for the query in the tags and description of images
    image_stmt = (
        select(ImageModel)
        .where(
            or_(
                ImageModel.tags.contains(query),
                ImageModel.description.ilike(f"%{query}%"),
            )
        )
        .order_by(ImageModel.timestamp.desc())
        .limit(1)
    )

    # Search for the query in the tags and description of videos
    video_stmt = (
        select(VideoModel)
        .where(
            or_(
                VideoModel.tags.contains(query),
                VideoModel.description.ilike(f"%{query}%"),
            )
        )
        .order_by(VideoModel.timestamp.desc())
        .limit(1)
    )

    # Execute both queries
    image_result = await db.execute(image_stmt)
    video_result = await db.execute(video_stmt)

    latest_image = image_result.scalar_one_or_none()
    latest_video = video_result.scalar_one_or_none()

    # Find the most recent between the two
    candidates = []
    if latest_image:
        candidates.append(latest_image)
    if latest_video:
        candidates.append(latest_video)

    most_recent = max(candidates, key=lambda x: x.timestamp) if candidates else None

    if most_recent:
        description = most_recent.description
        # Ensure tags is treated as a list
        tags_list = most_recent.tags if isinstance(most_recent.tags, list) else []
        tags = ", ".join(str(tag) for tag in tags_list)
        media_type = "photo" if isinstance(most_recent, ImageModel) else "video"
        return f"I last saw your {query} in a {media_type} of a {description} which contains {tags}."
    else:
        raise HTTPException(status_code=404, detail=f"I could not find your {query}.")
