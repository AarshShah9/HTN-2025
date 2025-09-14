import { useEffect, useState } from 'react';
import type { MemoryImage } from '../lib/types';
import { fetchMemories, type MemoriesData } from '../utils/fetchMemories';

export type UseMemoriesResult = {
  memories: MemoryImage[];
  loading: boolean;
  error: string | null;
  refetch: () => Promise<void>;
  totalCount: number;
};

export const useMemories = (): UseMemoriesResult => {
  const [memories, setMemories] = useState<MemoryImage[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [totalCount, setTotalCount] = useState(0);

  console.log(memories);

  const fetchMemoriesData = async () => {
    try {
      setLoading(true);
      setError(null);

      const data: MemoriesData = await fetchMemories();

      setMemories(data.images);
      setTotalCount(data.totalCount);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An unknown error occurred');
      setMemories([]);
      setTotalCount(0);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchMemoriesData();
  }, []);

  return {
    memories,
    loading,
    error,
    refetch: fetchMemoriesData,
    totalCount,
  };
};