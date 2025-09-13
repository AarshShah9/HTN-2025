// Mock memories data for demonstration - in a real app, these would come from your backend
import { API_URL } from '../constants';
import { mockImages } from '../lib/mockData';
import type { MemoryImage } from '../lib/types';

export type MemoriesData = {
  images: MemoryImage[];
  totalCount: number;
};

// Backend API response type
interface BackendImageResponse {
  id: string;
  path: string;
  timestamp: string;
  description: string | null;
  tags: string[];
  embeddings: Record<string, unknown> | null;
  tagged: boolean;
  audio_id: string | null;
  latitude: number | null;
  longitude: number | null;
}

/**
 * Fetches all memories from the backend
 * @returns Promise<MemoriesData> Object containing memories array and total count
 */
export const fetchMemories = async (): Promise<MemoriesData> => {
  try {
    // Make API call to backend
    const response = await fetch(`${API_URL}/image/`);
    
    if (!response.ok) {
      throw new Error(`Failed to fetch memories: ${response.status} ${response.statusText}`);
    }

    const backendImages: BackendImageResponse[] = await response.json();

    // Map backend response to frontend types
    const images: MemoryImage[] = backendImages.map((img) => ({
      id: img.id,
      date: new Date(img.timestamp).toISOString().split('T')[0], // Convert to YYYY-MM-DD format
      tags: img.tags,
      imageUrl: `${API_URL}/images/${img.path}`, // Construct full image URL
      transcript: img.description || '', // Use description as transcript for now
      location: img.latitude && img.longitude 
        ? `${img.latitude.toFixed(4)}, ${img.longitude.toFixed(4)}` 
        : undefined,
      latitude: img.latitude || undefined,
      longitude: img.longitude || undefined,
      people: [] // Could be derived from tags in the future
    }));

    return {
      images,
      totalCount: images.length
    };
  } catch (error) {
    console.error('Error fetching memories from backend:', error);
    // Fallback to mock data if backend is not available
    console.log('Falling back to mock data');
    return {
      images: mockImages,
      totalCount: mockImages.length
    };
  }
};