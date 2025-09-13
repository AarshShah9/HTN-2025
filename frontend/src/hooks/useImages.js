import { useState, useMemo, useEffect, useCallback } from 'react';

// API base URL - adjust if needed
const API_BASE_URL = '/api/images';

// API functions for CRUD operations
const imageAPI = {
  // Fetch all images
  async fetchImages(skip = 0, limit = 100, taggedOnly = null) {
    try {
      const params = new URLSearchParams({ skip: skip.toString(), limit: limit.toString() });
      if (taggedOnly !== null) {
        params.append('tagged_only', taggedOnly.toString());
      }
      
      const response = await fetch(`${API_BASE_URL}?${params}`);
      if (!response.ok) {
        throw new Error(`Failed to fetch images: ${response.statusText}`);
      }
      return await response.json();
    } catch (error) {
      console.error('Error fetching images:', error);
      throw error;
    }
  },

  // Search images by tags
  async searchByTags(tags, skip = 0, limit = 100) {
    try {
      const tagsParam = Array.isArray(tags) ? tags.join(',') : tags;
      const params = new URLSearchParams({ 
        tags: tagsParam, 
        skip: skip.toString(), 
        limit: limit.toString() 
      });
      
      const response = await fetch(`${API_BASE_URL}/search/by-tags?${params}`);
      if (!response.ok) {
        throw new Error(`Failed to search images: ${response.statusText}`);
      }
      return await response.json();
    } catch (error) {
      console.error('Error searching images by tags:', error);
      throw error;
    }
  },

  // Get image statistics
  async getStats() {
    try {
      const response = await fetch(`${API_BASE_URL}/stats/counts`);
      if (!response.ok) {
        throw new Error(`Failed to fetch stats: ${response.statusText}`);
      }
      return await response.json();
    } catch (error) {
      console.error('Error fetching image stats:', error);
      throw error;
    }
  },

  // Create a new image
  async createImage(imageData) {
    try {
      const response = await fetch(API_BASE_URL, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(imageData),
      });
      if (!response.ok) {
        throw new Error(`Failed to create image: ${response.statusText}`);
      }
      return await response.json();
    } catch (error) {
      console.error('Error creating image:', error);
      throw error;
    }
  },

  // Update an image
  async updateImage(imageId, updateData) {
    try {
      const response = await fetch(`${API_BASE_URL}/${imageId}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(updateData),
      });
      if (!response.ok) {
        throw new Error(`Failed to update image: ${response.statusText}`);
      }
      return await response.json();
    } catch (error) {
      console.error('Error updating image:', error);
      throw error;
    }
  },

  // Delete an image
  async deleteImage(imageId) {
    try {
      const response = await fetch(`${API_BASE_URL}/${imageId}`, {
        method: 'DELETE',
      });
      if (!response.ok) {
        throw new Error(`Failed to delete image: ${response.statusText}`);
      }
      return true;
    } catch (error) {
      console.error('Error deleting image:', error);
      throw error;
    }
  }
};

// Transform backend image data to frontend format
const transformImageData = (backendImage) => {
  return {
    id: backendImage.id,
    url: backendImage.path, // Assuming path contains the URL or can be used as URL
    alt: backendImage.description || 'Image',
    tags: backendImage.tags || [],
    timestamp: backendImage.timestamp
  };
};

// Parse search query to determine search type
const parseSearchQuery = (query) => {
  const trimmedQuery = query.trim();
  
  if (trimmedQuery.startsWith('tag:')) {
    return {
      type: 'tag',
      value: trimmedQuery.substring(4).trim()
    };
  } else if (trimmedQuery.startsWith('audio:')) {
    return {
      type: 'audio',
      value: trimmedQuery.substring(6).trim()
    };
  } else {
    // Default to tag search for backward compatibility
    return {
      type: 'tag',
      value: trimmedQuery
    };
  }
};

// API call for audio-based search
const searchImagesByAudio = async (audioDescription) => {
  try {
    const response = await fetch(`/api/image/images_by_audio?audio_description=${encodeURIComponent(audioDescription)}`);
    if (!response.ok) {
      throw new Error('Failed to search images by audio');
    }
    const data = await response.json();
    return data.image_ids || [];
  } catch (error) {
    console.error('Error searching images by audio:', error);
    return [];
  }
};

export const useImages = () => {
  const [images, setImages] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedRange, setSelectedRange] = useState(null);
  const [audioFilteredIds, setAudioFilteredIds] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [stats, setStats] = useState({ total_images: 0, tagged_images: 0, untagged_images: 0 });

  // Load images from backend on component mount
  const loadImages = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const backendImages = await imageAPI.fetchImages();
      const transformedImages = backendImages.map(transformImageData);
      setImages(transformedImages);
      
      // Also load stats
      const statsData = await imageAPI.getStats();
      setStats(statsData);
    } catch (err) {
      setError(err.message);
      console.error('Failed to load images:', err);
    } finally {
      setLoading(false);
    }
  }, []);

  // Load images on mount
  useEffect(() => {
    loadImages();
  }, [loadImages]);

  // Handle search when query changes
  useEffect(() => {
    const searchData = parseSearchQuery(searchQuery);
    
    if (searchData.type === 'audio' && searchData.value) {
      searchImagesByAudio(searchData.value).then(ids => {
        setAudioFilteredIds(ids);
      });
    } else {
      setAudioFilteredIds([]);
    }
  }, [searchQuery]);

  // Search images using backend API for tag-based searches
  const searchImages = useCallback(async (query) => {
    if (!query.trim()) {
      return loadImages(); // Load all images if no query
    }

    const searchData = parseSearchQuery(query);
    
    if (searchData.type === 'tag') {
      setLoading(true);
      setError(null);
      try {
        const backendImages = await imageAPI.searchByTags(searchData.value);
        const transformedImages = backendImages.map(transformImageData);
        setImages(transformedImages);
      } catch (err) {
        setError(err.message);
        console.error('Failed to search images:', err);
      } finally {
        setLoading(false);
      }
    }
  }, [loadImages]);

  // Trigger search when query changes (debounced effect would be better in production)
  useEffect(() => {
    const searchData = parseSearchQuery(searchQuery);
    
    if (searchData.type === 'tag') {
      searchImages(searchQuery);
    } else if (searchData.type === 'audio' && searchData.value) {
      searchImagesByAudio(searchData.value).then(ids => {
        setAudioFilteredIds(ids);
      });
    } else if (!searchQuery.trim()) {
      loadImages(); // Reload all images when search is cleared
    }
  }, [searchQuery, searchImages, loadImages]);

  // Filter images based on time range and audio search results
  const filteredImages = useMemo(() => {
    let filtered = images;
    const searchData = parseSearchQuery(searchQuery);

    // For audio search, filter by returned IDs
    if (searchData.type === 'audio' && searchQuery.trim()) {
      if (audioFilteredIds.length > 0) {
        filtered = filtered.filter(image => 
          audioFilteredIds.includes(image.id.toString()) || audioFilteredIds.includes(image.id)
        );
      } else {
        // If no matching IDs, show no results
        filtered = [];
      }
    }

    // Filter by selected time range
    if (selectedRange) {
      const startTime = new Date(selectedRange.startTime);
      const endTime = new Date(selectedRange.endTime);
      
      filtered = filtered.filter(image => {
        const imageDate = new Date(image.timestamp);
        return imageDate >= startTime && imageDate <= endTime;
      });
    }

    return filtered;
  }, [images, searchQuery, selectedRange, audioFilteredIds]);

  // CRUD operations for external use
  const createImage = useCallback(async (imageData) => {
    setLoading(true);
    setError(null);
    try {
      const newImage = await imageAPI.createImage(imageData);
      const transformedImage = transformImageData(newImage);
      setImages(prev => [...prev, transformedImage]);
      
      // Refresh stats
      const statsData = await imageAPI.getStats();
      setStats(statsData);
      
      return transformedImage;
    } catch (err) {
      setError(err.message);
      throw err;
    } finally {
      setLoading(false);
    }
  }, []);

  const updateImage = useCallback(async (imageId, updateData) => {
    setLoading(true);
    setError(null);
    try {
      const updatedImage = await imageAPI.updateImage(imageId, updateData);
      const transformedImage = transformImageData(updatedImage);
      setImages(prev => prev.map(img => img.id === imageId ? transformedImage : img));
      return transformedImage;
    } catch (err) {
      setError(err.message);
      throw err;
    } finally {
      setLoading(false);
    }
  }, []);

  const deleteImage = useCallback(async (imageId) => {
    setLoading(true);
    setError(null);
    try {
      await imageAPI.deleteImage(imageId);
      setImages(prev => prev.filter(img => img.id !== imageId));
      
      // Refresh stats
      const statsData = await imageAPI.getStats();
      setStats(statsData);
      
      return true;
    } catch (err) {
      setError(err.message);
      throw err;
    } finally {
      setLoading(false);
    }
  }, []);

  return {
    images: filteredImages,
    searchQuery,
    setSearchQuery,
    selectedRange,
    setSelectedRange,
    totalImages: stats.total_images,
    filteredCount: filteredImages.length,
    loading,
    error,
    stats,
    // CRUD operations
    createImage,
    updateImage,
    deleteImage,
    refreshImages: loadImages
  };
};
