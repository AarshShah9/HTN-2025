import base64
from typing import List, Optional

from database.database import get_db_session
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession

from app.models.models import VideoCreate, VideoResponse
from app.repository.audio_repository import AudioRepository
from app.repository.video_repository import VideoRepository
from app.utils.transcription import transcribe_audio_from_bytes
from database.models import VideoModel

router = APIRouter(prefix="/video", tags=["videos"])


def get_video_repository(
    session: AsyncSession = Depends(get_db_session),
) -> VideoRepository:
    return VideoRepository(session)


def get_audio_repository(
    session: AsyncSession = Depends(get_db_session),
) -> AudioRepository:
    return AudioRepository(session)


async def build_video_response(
    video: VideoModel, audio_repo: AudioRepository
) -> VideoResponse:
    """Build a VideoResponse with transcript included from AudioModel."""
    transcript = None
    if video.audio_id:
        audio = await audio_repo.get_audio_by_id(video.audio_id)
        if audio:
            transcript = audio.transcription
    
    # Create response dict from video model
    video_dict = {
        "id": video.id,
        "timestamp": video.timestamp,
        "tagged": video.tagged,
        "frames": video.frames,
        "tags": video.tags,
        "fps": video.fps,
        "duration": video.duration,
        "audio_id": video.audio_id,
        "latitude": video.latitude,
        "longitude": video.longitude,
        "transcript": transcript,
    }
    
    return VideoResponse(**video_dict)

@router.get("/ids", response_model=List[str])
async def get_video_ids(
    repository: VideoRepository = Depends(get_video_repository),
):
    return await repository.get_all_video_ids()

@router.post("/", response_model=VideoResponse, status_code=status.HTTP_201_CREATED)
async def create_video(
    video_data: VideoCreate,
    video_repo: VideoRepository = Depends(get_video_repository),
    audio_repo: AudioRepository = Depends(get_audio_repository),
):
    """Create a new video record with optional audio.

    If audio is provided, it will be transcribed and stored in the audio table,
    and the video will be linked to the audio record.
    """
    try:
        audio_id = None

        # Handle audio if provided
        if video_data.transcript:
            try:
                # Transcribe the audio
                transcription = video_data.transcript

                # Create audio record
                audio = await audio_repo.create_audio(transcription=transcription)
                audio_id = str(audio.id)
            except Exception as e:
                # Log the error but don't fail the video creation
                print(f"Error processing audio: {str(e)}")

        # Create video record
        video = await video_repo.create_video(
            tagged=video_data.tagged,
            frames=video_data.frames,
            tags=video_data.tags,
            fps=video_data.fps,
            duration=video_data.duration,
            audio_id=audio_id,
            latitude=video_data.latitude,
            longitude=video_data.longitude,
        )
        return await build_video_response(video, audio_repo)
    except Exception as e:
        print(e)
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Failed to create video: {str(e)}",
        )


@router.get("/{video_id}", response_model=VideoResponse)
async def get_video(
    video_id: str, 
    repository: VideoRepository = Depends(get_video_repository),
    audio_repo: AudioRepository = Depends(get_audio_repository),
):
    """Get a video by ID."""
    video = await repository.get_video_by_id(video_id)
    if not video:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Video not found"
        )
    return await build_video_response(video, audio_repo)


@router.get("/", response_model=List[VideoResponse])
async def get_videos(
    skip: int = 0,
    limit: int = 100,
    tagged_only: Optional[bool] = None,
    repository: VideoRepository = Depends(get_video_repository),
    audio_repo: AudioRepository = Depends(get_audio_repository),
):
    """Get all videos with optional filtering."""
    if tagged_only is True:
        videos = await repository.get_tagged_videos(skip=skip, limit=limit)
    elif tagged_only is False:
        videos = await repository.get_untagged_videos(skip=skip, limit=limit)
    else:
        videos = await repository.get_all_videos(skip=skip, limit=limit)

    return [await build_video_response(video, audio_repo) for video in videos]


@router.get("/search/by-tags", response_model=List[VideoResponse])
async def search_videos_by_tags(
    tags: str,  # Comma-separated tags
    skip: int = 0,
    limit: int = 100,
    repository: VideoRepository = Depends(get_video_repository),
    audio_repo: AudioRepository = Depends(get_audio_repository),
):
    """Search videos by tags."""
    tag_list = [tag.strip() for tag in tags.split(",") if tag.strip()]
    if not tag_list:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="At least one tag must be provided",
        )

    videos = await repository.search_videos_by_tags(tag_list, skip=skip, limit=limit)
    return [await build_video_response(video, audio_repo) for video in videos]


@router.delete("/{video_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_video(
    video_id: str, repository: VideoRepository = Depends(get_video_repository)
):
    """Delete a video record."""
    deleted = await repository.delete_video(video_id)
    if not deleted:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Video not found"
        )


@router.get("/stats/counts")
async def get_video_stats(repository: VideoRepository = Depends(get_video_repository)):
    """Get video statistics."""
    total = await repository.count_videos()
    tagged = await repository.count_tagged_videos()
    untagged = await repository.count_untagged_videos()

    return {"total_videos": total, "tagged_videos": tagged, "untagged_videos": untagged}


@router.get("/stats/locations")
async def get_video_locations(
    repository: VideoRepository = Depends(get_video_repository),
):
    """Get video locations."""
    locations = await repository.get_video_locations()
    return locations


@router.get("/videos_by_embedding")
async def get_videos_by_embedding(
    audio_description: str,
    video_repo: VideoRepository = Depends(get_video_repository),
    audio_repo: AudioRepository = Depends(get_audio_repository),
):
    """
    Search for videos based on audio description.
    This endpoint matches the audio description against audio transcriptions.
    """
    try:
        # Search for similar audio transcriptions
        similar_audios_with_scores = await audio_repo.search_audio_by_similarity(
            query_text=audio_description, limit=10
        )

        # Get audio IDs from the search results (extract audio from tuples)
        audio_ids = [str(audio.id) for audio, score in similar_audios_with_scores]

        # Get videos that reference these audio IDs
        videos = []
        for audio_id in audio_ids:
            video = await video_repo.get_video_by_audio_id(audio_id)
            if video:
                videos.append(video)

        return [await build_video_response(video, audio_repo) for video in videos]
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Failed to search videos by audio: {str(e)}",
        )
