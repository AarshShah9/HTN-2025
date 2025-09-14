import { useEffect, useState } from 'react';
import type { MemoryVideo } from '../lib/types';
import { fetchVideos, type VideosData } from '../utils/fetchVideos';

export type UseVideosResult = {
  videos: MemoryVideo[];
  loading: boolean;
  error: string | null;
  refetch: () => Promise<void>;
  totalCount: number;
};

export const useVideos = (): UseVideosResult => {
  const [videos, setVideos] = useState<MemoryVideo[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [totalCount, setTotalCount] = useState(0);

  const fetchVideosData = async () => {
    try {
      setLoading(true);
      setError(null);

      const data: VideosData = await fetchVideos();

      setVideos(data.videos);
      setTotalCount(data.totalCount);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An unknown error occurred');
      setVideos([]);
      setTotalCount(0);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchVideosData();
  }, []);

  return {
    videos,
    loading,
    error,
    refetch: fetchVideosData,
    totalCount,
  };
};
