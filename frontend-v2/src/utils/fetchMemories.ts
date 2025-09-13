// Mock memories data for demonstration - in a real app, these would come from your backend
import { mockImages } from '../lib/mockData';
import type { MemoryImage } from '../lib/types';

export type MemoriesData = {
  images: MemoryImage[];
  totalCount: number;
};

/**
 * Fetches all memories from the backend
 * @returns Promise<MemoriesData> Object containing memories array and total count
 */
export const fetchMemories = async (): Promise<MemoriesData> => {
  try {
    // Simulate API delay
    await new Promise(resolve => setTimeout(resolve, 800));

    // In a real application, this would make an API call to your backend
    // const response = await fetch('/api/memories');
    // const memoriesData = await response.json();

    // Simulate occasional errors (5% chance)
    if (Math.random() < 0.05) {
      throw new Error('Failed to fetch memories. Please try again.');
    }

    // For now, return mock data
    return {
      images: mockImages,
      totalCount: mockImages.length
    };
  } catch (error) {
    console.error('Error fetching memories:', error);
    throw error;
  }
};