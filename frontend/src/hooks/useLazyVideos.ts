import { useEffect, useState, useCallback } from 'react';
import type { MemoryVideo } from '../lib/types';
import { API_URL } from '../constants';

export type UseLazyVideosResult = {
  videos: MemoryVideo[];
  loading: boolean;
  error: string | null;
  refetch: () => Promise<void>;
  totalCount: number;
  loadedCount: number;
  isLoadingMore: boolean;
};

// Backend API response type for individual video
interface BackendVideoResponse {
  id: string;
  frames: string[];
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
 * Fetches video IDs from the backend
 */
const fetchVideoIds = async (): Promise<string[]> => {
  const response = await fetch(`${API_URL}/video/ids`);
  if (!response.ok) {
    throw new Error(`Failed to fetch video IDs: ${response.status} ${response.statusText}`);
  }
  return response.json();
};

/**
 * Fetches a single video by ID from the backend
 */
const fetchVideoById = async (videoId: string): Promise<MemoryVideo> => {
  const response = await fetch(`${API_URL}/video/${videoId}`);
  if (!response.ok) {
    throw new Error(`Failed to fetch video ${videoId}: ${response.status} ${response.statusText}`);
  }
  
  const video: BackendVideoResponse = await response.json();
  
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
};

export const useLazyVideos = (): UseLazyVideosResult => {
  const [videos, setVideos] = useState<MemoryVideo[]>([]);
  const [videoIds, setVideoIds] = useState<string[]>([]);
  const [loading, setLoading] = useState(true);
  const [isLoadingMore, setIsLoadingMore] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [loadedCount, setLoadedCount] = useState(0);

  // Load individual videos one by one
  const loadNextVideo = useCallback(async (ids: string[], currentVideos: MemoryVideo[]) => {
    if (currentVideos.length >= ids.length) return;
    
    const nextId = ids[currentVideos.length];
    setIsLoadingMore(true);
    
    try {
      const video = await fetchVideoById(nextId);
      setVideos(prev => {
        // Sort by date (newest first) when adding
        const newVideos = [...prev, video];
        return newVideos.sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime());
      });
      setLoadedCount(prev => prev + 1);
      
      // Small delay to make loading visible and prevent overwhelming the server
      await new Promise(resolve => setTimeout(resolve, 100));
    } catch (err) {
      console.error(`Failed to load video ${nextId}:`, err);
      // Continue loading other videos even if one fails
    } finally {
      setIsLoadingMore(false);
    }
  }, []);

  // Load videos sequentially
  useEffect(() => {
    if (videoIds.length === 0 || videos.length >= videoIds.length) return;
    
    const timeoutId = setTimeout(() => {
      loadNextVideo(videoIds, videos);
    }, 50); // Small delay between requests
    
    return () => clearTimeout(timeoutId);
  }, [videoIds, videos.length, loadNextVideo]);

  const fetchData = async () => {
    try {
      setLoading(true);
      setError(null);
      setVideos([]);
      setLoadedCount(0);

      // First, get all video IDs
      const ids = await fetchVideoIds();
      setVideoIds(ids);
      
      // Initial loading state is complete once we have IDs
      setLoading(false);
      
      // Videos will start loading automatically via useEffect
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An unknown error occurred');
      setVideos([]);
      setVideoIds([]);
      setLoadedCount(0);
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  return {
    videos,
    loading,
    error,
    refetch: fetchData,
    totalCount: videoIds.length,
    loadedCount,
    isLoadingMore,
  };
};
