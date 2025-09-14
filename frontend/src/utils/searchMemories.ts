import { API_URL } from '../constants';
import type { MemoryImage } from '../lib/types';

// Backend API response type for images_by_transcript endpoint  
interface BackendImageResponse {
  id: string;
  image?: string; // base64 without data URI header
  path?: string;
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
 * Search memories using semantic similarity based on transcript/description
 * Uses the backend's AI-powered semantic search endpoint
 * 
 * @param transcript - Text description to search for (e.g., "a dog playing in the park")
 * @param limit - Maximum number of results to return (default: 10)
 * @returns Promise<MemoryImage[]> - Array of memories ordered by semantic similarity
 */
export const searchMemoriesByTranscript = async (
  transcript: string, 
  limit: number = 10
): Promise<MemoryImage[]> => {
  try {
    // Validate input
    if (!transcript.trim()) {
      return [];
    }

    // Build query parameters
    const params = new URLSearchParams({
      transcript: transcript.trim(),
      limit: Math.min(limit, 50).toString() // Cap at 50 for performance
    });

    // Make API call to backend semantic search endpoint
    const response = await fetch(`${API_URL}/image/images_by_transcript?${params}`);
    
    if (!response.ok) {
      throw new Error(`Semantic search failed: ${response.status} ${response.statusText}`);
    }

    const backendImages: BackendImageResponse[] = await response.json();

    // Map backend response to frontend types
    const images: MemoryImage[] = backendImages.map((img) => {
      // Handle image URL - prefer base64 over path
      let imageUrl: string;
      if (img.image) {
        imageUrl = img.image.startsWith('data:') ? img.image : `data:image/jpeg;base64,${img.image}`;
      } else if (img.path) {
        imageUrl = `${API_URL}/images/${img.path}`;
      } else {
        imageUrl = '';
      }

      return {
        id: img.id,
        date: new Date(img.timestamp).toISOString().split('T')[0],
        tags: img.tags,
        imageUrl,
        description: img.description || '',
        location: img.latitude && img.longitude
          ? `${img.latitude.toFixed(4)}, ${img.longitude.toFixed(4)}`
          : undefined,
        latitude: img.latitude || undefined,
        longitude: img.longitude || undefined,
      };
    });

    return images;
  } catch (error) {
    console.error('Error performing semantic search:', error);
    // Return empty array on error rather than throwing
    // This allows fallback to client-side search if needed
    return [];
  }
};