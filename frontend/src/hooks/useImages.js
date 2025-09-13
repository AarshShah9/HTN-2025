import { useState, useMemo } from 'react';

// Default image data with tags
const defaultImages = [
  {
    id: 1,
    url: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
    alt: 'Mountain landscape',
    tags: ['nature', 'mountain', 'landscape', 'outdoor', 'scenic']
  },
  {
    id: 2,
    url: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=400&h=300&fit=crop',
    alt: 'Forest path',
    tags: ['nature', 'forest', 'trees', 'path', 'green']
  },
  {
    id: 3,
    url: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=400&h=300&fit=crop',
    alt: 'Lake reflection',
    tags: ['nature', 'lake', 'water', 'reflection', 'peaceful']
  },
  {
    id: 4,
    url: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
    alt: 'Ocean waves',
    tags: ['ocean', 'waves', 'beach', 'water', 'blue']
  },
  {
    id: 5,
    url: 'https://images.unsplash.com/photo-1518837695005-2083093ee35b?w=400&h=300&fit=crop',
    alt: 'Desert sunset',
    tags: ['desert', 'sunset', 'sand', 'warm', 'golden']
  },
  {
    id: 6,
    url: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
    alt: 'City skyline',
    tags: ['city', 'urban', 'buildings', 'skyline', 'modern']
  }
];

export const useImages = () => {
  const [images] = useState(defaultImages);
  const [searchQuery, setSearchQuery] = useState('');

  // Filter images based on search query matching tags
  const filteredImages = useMemo(() => {
    if (!searchQuery.trim()) {
      return images;
    }

    const query = searchQuery.toLowerCase();
    return images.filter(image => 
      image.tags.some(tag => tag.toLowerCase().includes(query)) ||
      image.alt.toLowerCase().includes(query)
    );
  }, [images, searchQuery]);

  return {
    images: filteredImages,
    searchQuery,
    setSearchQuery,
    totalImages: images.length,
    filteredCount: filteredImages.length
  };
};
