import { useState, useMemo, useEffect } from 'react';

// Default image data with tags and ISO 8601 timestamps
const defaultImages = [
  {
    id: 1,
    url: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
    alt: 'Mountain landscape',
    tags: ['nature', 'mountain', 'landscape', 'outdoor', 'scenic'],
    timestamp: '2024-12-15T08:30:00.000Z'
  },
  {
    id: 2,
    url: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400&h=300&fit=crop',
    alt: 'Forest path',
    tags: ['nature', 'forest', 'trees', 'path', 'green'],
    timestamp: '2024-12-14T14:22:00.000Z'
  },
  {
    id: 3,
    url: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400&h=300&fit=crop',
    alt: 'Lake reflection',
    tags: ['nature', 'lake', 'water', 'reflection', 'peaceful'],
    timestamp: '2024-12-13T17:45:00.000Z'
  },
  {
    id: 4,
    url: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
    alt: 'Ocean waves',
    tags: ['ocean', 'waves', 'beach', 'water', 'blue'],
    timestamp: '2024-12-12T11:15:00.000Z'
  },
  {
    id: 5,
    url: 'https://images.unsplash.com/photo-1518837695005-2083093ee35b?w=400&h=300&fit=crop',
    alt: 'Desert sunset',
    tags: ['desert', 'sunset', 'sand', 'warm', 'golden'],
    timestamp: '2024-12-11T19:30:00.000Z'
  },
  {
    id: 6,
    url: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
    alt: 'City skyline',
    tags: ['city', 'urban', 'buildings', 'skyline', 'modern'],
    timestamp: '2024-12-10T09:00:00.000Z'
  }
];

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
  const [images, setImages] = useState(defaultImages);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedRange, setSelectedRange] = useState(null);
  const [audioFilteredIds, setAudioFilteredIds] = useState([]);

  // Handle audio search when query changes
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

  // Filter images based on search query and time range
  const filteredImages = useMemo(() => {
    let filtered = images;
    const searchData = parseSearchQuery(searchQuery);

    // Filter by search query
    if (searchQuery.trim()) {
      if (searchData.type === 'tag') {
        // Tag-based search (existing functionality)
        const query = searchData.value.toLowerCase();
        filtered = filtered.filter(image => 
          image.tags.some(tag => tag.toLowerCase().includes(query)) ||
          image.alt.toLowerCase().includes(query)
        );
      } else if (searchData.type === 'audio') {
        // Audio-based search - filter by IDs returned from API
        if (audioFilteredIds.length > 0) {
          filtered = filtered.filter(image => 
            audioFilteredIds.includes(image.id.toString()) || audioFilteredIds.includes(image.id)
          );
        } else {
          // If no matching IDs, show no results
          filtered = [];
        }
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

  return {
    images: filteredImages,
    searchQuery,
    setSearchQuery,
    selectedRange,
    setSelectedRange,
    totalImages: images.length,
    filteredCount: filteredImages.length
  };
};
