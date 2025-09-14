import { API_URL } from '../constants';
import type { MemoryVideo } from '../lib/types';

export type VideosData = {
  videos: MemoryVideo[];
  totalCount: number;
};

// Backend API response type for videos
interface BackendVideoResponse {
  id: string;
  frames: string[]; // Array of base64 frame strings
  timestamp: string;
  description: string | null;
  tags: string[];
  embeddings: Record<string, unknown> | null;
  tagged: boolean;
  fps: number;
  duration: number;
  audio_id: string | null;
  transcript: string | null;
  latitude: number | null;
  longitude: number | null;
}


/**
 * Fetches all videos from the backend
 * @returns Promise<VideosData> Object containing videos array and total count
 */
export const fetchVideos = async (): Promise<VideosData> => {
  try {
    // Make API call to backend to get videos
    const response = await fetch(`${API_URL}/video/`);
    
    if (!response.ok) {
      throw new Error(`Failed to fetch videos: ${response.status} ${response.statusText}`);
    }

    const backendVideos: BackendVideoResponse[] = await response.json();

    // Map backend response to frontend types
    const videos: MemoryVideo[] = backendVideos.map((video) => {
      return {
        id: video.id,
        date: new Date(video.timestamp).toISOString().split('T')[0],
        tags: video.tags,
        frames: video.frames,
        description: video.description || '',
        location: video.latitude && video.longitude
          ? `${video.latitude.toFixed(4)}, ${video.longitude.toFixed(4)}`
          : undefined,
        latitude: video.latitude || undefined,
        longitude: video.longitude || undefined,
        fps: video.fps,
        duration: video.duration,
        audio_id: video.audio_id || undefined,
        transcription: video.transcript || undefined,
      };
    });

    return {
      videos,
      totalCount: videos.length
    };
  } catch (error) {
    console.error('Error fetching videos from backend:', error);
    // Return empty data if backend is not available
    return {
      videos: [],
      totalCount: 0
    };
  }
};
