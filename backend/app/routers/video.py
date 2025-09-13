from typing import List, Optional
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.models.models import VideoCreate, VideoUpdate, VideoResponse
from app.repository.video_repository import VideoRepository
from database.database import get_db_session

router = APIRouter(prefix="/api/video", tags=["videos"])

def get_video_repository(session: AsyncSession = Depends(get_db_session)) -> VideoRepository:
    return VideoRepository(session)

@router.post("/", response_model=VideoResponse, status_code=status.HTTP_201_CREATED)
async def create_video(
    video_data: VideoCreate,
    repository: VideoRepository = Depends(get_video_repository)
):
    """Create a new video record."""
    try:
        video = await repository.create_video(
            frames=video_data.frames,
            description=video_data.description,
            tags=video_data.tags,
            embeddings=video_data.embeddings,
            tagged=video_data.tagged,
            fps=video_data.fps,
            duration=video_data.duration,
            latitude=video_data.latitude,
            longitude=video_data.longitude
        )
        return VideoResponse.from_orm(video)
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Failed to create video: {str(e)}"
        )

@router.get("/{video_id}", response_model=VideoResponse)
async def get_video(
    video_id: str,
    repository: VideoRepository = Depends(get_video_repository)
):
    """Get a video by ID."""
    video = await repository.get_video_by_id(video_id)
    if not video:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Video not found"
        )
    return VideoResponse.from_orm(video)

@router.get("/", response_model=List[VideoResponse])
async def get_videos(
    skip: int = 0,
    limit: int = 100,
    tagged_only: Optional[bool] = None,
    repository: VideoRepository = Depends(get_video_repository)
):
    """Get all videos with optional filtering."""
    if tagged_only is True:
        videos = await repository.get_tagged_videos(skip=skip, limit=limit)
    elif tagged_only is False:
        videos = await repository.get_untagged_videos(skip=skip, limit=limit)
    else:
        videos = await repository.get_all_videos(skip=skip, limit=limit)
    
    return [VideoResponse.from_orm(video) for video in videos]

@router.get("/search/by-tags", response_model=List[VideoResponse])
async def search_videos_by_tags(
    tags: str,  # Comma-separated tags
    skip: int = 0,
    limit: int = 100,
    repository: VideoRepository = Depends(get_video_repository)
):
    """Search videos by tags."""
    tag_list = [tag.strip() for tag in tags.split(",") if tag.strip()]
    if not tag_list:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="At least one tag must be provided"
        )
    
    videos = await repository.search_videos_by_tags(tag_list, skip=skip, limit=limit)
    return [VideoResponse.from_orm(video) for video in videos]

@router.get("/search/by-duration", response_model=List[VideoResponse])
async def search_videos_by_duration(
    min_duration: Optional[float] = None,
    max_duration: Optional[float] = None,
    skip: int = 0,
    limit: int = 100,
    repository: VideoRepository = Depends(get_video_repository)
):
    """Search videos by duration range."""
    if min_duration is not None and min_duration < 0:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Minimum duration must be non-negative"
        )
    if max_duration is not None and max_duration < 0:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Maximum duration must be non-negative"
        )
    if min_duration is not None and max_duration is not None and min_duration > max_duration:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Minimum duration cannot be greater than maximum duration"
        )
    
    videos = await repository.get_videos_by_duration_range(
        min_duration=min_duration,
        max_duration=max_duration,
        skip=skip,
        limit=limit
    )
    return [VideoResponse.from_orm(video) for video in videos]

@router.get("/search/by-frame-count", response_model=List[VideoResponse])
async def search_videos_by_frame_count(
    min_frames: Optional[int] = None,
    max_frames: Optional[int] = None,
    skip: int = 0,
    limit: int = 100,
    repository: VideoRepository = Depends(get_video_repository)
):
    """Search videos by frame count range."""
    if min_frames is not None and min_frames < 0:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Minimum frame count must be non-negative"
        )
    if max_frames is not None and max_frames < 0:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Maximum frame count must be non-negative"
        )
    if min_frames is not None and max_frames is not None and min_frames > max_frames:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Minimum frame count cannot be greater than maximum frame count"
        )
    
    videos = await repository.get_videos_by_frame_count_range(
        min_frames=min_frames,
        max_frames=max_frames,
        skip=skip,
        limit=limit
    )
    return [VideoResponse.from_orm(video) for video in videos]

@router.put("/{video_id}", response_model=VideoResponse)
async def update_video(
    video_id: str,
    video_update: VideoUpdate,
    repository: VideoRepository = Depends(get_video_repository)
):
    """Update a video record."""
    updated_video = await repository.update_video(
        video_id=video_id,
        description=video_update.description,
        tags=video_update.tags,
        embeddings=video_update.embeddings,
        tagged=video_update.tagged,
        fps=video_update.fps,
        duration=video_update.duration
    )
    
    if not updated_video:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Video not found"
        )
    
    return VideoResponse.from_orm(updated_video)

@router.delete("/{video_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_video(
    video_id: str,
    repository: VideoRepository = Depends(get_video_repository)
):
    """Delete a video record."""
    deleted = await repository.delete_video(video_id)
    if not deleted:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Video not found"
        )

@router.get("/stats/counts")
async def get_video_stats(
    repository: VideoRepository = Depends(get_video_repository)
):
    """Get video statistics."""
    total = await repository.count_videos()
    tagged = await repository.count_tagged_videos()
    untagged = await repository.count_untagged_videos()
    
    return {
        "total_videos": total,
        "tagged_videos": tagged,
        "untagged_videos": untagged
    }
    
@router.get("/stats/locations")
async def get_video_locations(
    repository: VideoRepository = Depends(get_video_repository)
):
    """Get video locations."""
    locations = await repository.get_video_locations()
    return locations

@router.get("/videos_by_audio")
def get_videos_by_audio(audio_description: str):
    """
    Search for videos based on audio description.
    This endpoint matches the audio description against video descriptions and tags.
    """
    # Placeholder for future implementation
    return {"message": "Audio-based video search not yet implemented", "query": audio_description}