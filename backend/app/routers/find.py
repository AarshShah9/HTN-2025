from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database.database import get_db
from database.models import ImageModel, VideoModel
from sqlalchemy import or_, func

router = APIRouter()

@router.get("/find")
def find_item(query: str, db: Session = Depends(get_db)):
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
    image_query = db.query(ImageModel).filter(
        or_(
            ImageModel.tags.contains(query),
            ImageModel.description.ilike(f"%{query}%")
        )
    )

    # Search for the query in the tags and description of videos
    video_query = db.query(VideoModel).filter(
        or_(
            VideoModel.tags.contains(query),
            VideoModel.description.ilike(f"%{query}%")
        )
    )

    # Combine the queries and order by timestamp
    all_results = image_query.union(video_query).order_by(func.coalesce(ImageModel.timestamp, VideoModel.timestamp).desc())

    # Get the most recent result
    most_recent = all_results.first()

    if most_recent:
        description = most_recent.description
        tags = ", ".join(most_recent.tags)
        return f"I last saw your {query} in a {'photo' if isinstance(most_recent, ImageModel) else 'video'} of a {description} which contains {tags}."
    else:
        raise HTTPException(status_code=404, detail=f"I could not find your {query}.")
    