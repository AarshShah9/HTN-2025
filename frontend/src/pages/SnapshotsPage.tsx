import React, { useState, useRef, useEffect, useCallback } from 'react';
import { useMemories } from '../hooks/useMemories';
import { useVideos } from '../hooks/useVideos';
import type { SnapshotItem, MemoryVideo } from '../lib/types';
import { isVideo } from '../lib/types';

interface CarouselItemProps {
  item: SnapshotItem;
  index: number;
  hoveredIndex: number | null;
  onHover: (index: number | null) => void;
  onClick: (item: SnapshotItem) => void;
}

const CarouselItem: React.FC<CarouselItemProps> = ({ 
  item, 
  index, 
  hoveredIndex, 
  onHover, 
  onClick 
}) => {
  const isHovered = hoveredIndex === index;
  const distance = hoveredIndex !== null ? Math.abs(index - hoveredIndex) : 3;
  
  // Calculate scale based on distance from hovered item (minimal intensity)
  let scale = 1;
  if (hoveredIndex !== null) {
    if (distance === 0) scale = 1.05; // Center item (further reduced)
    else if (distance === 1) scale = 1.02; // Adjacent items (minimal change)
    else scale = 1; // All other items stay normal size
  }

  const getImageSrc = useCallback((item: SnapshotItem): string => {
    if (isVideo(item)) {
      // Use first frame for video thumbnail - frames are already base64 encoded
      return item.frames.length > 0 
        ? (item.frames[0].startsWith('data:') ? item.frames[0] : `data:image/jpeg;base64,${item.frames[0]}`)
        : '';
    }
    return item.imageUrl;
  }, []);

  return (
    <div
      className={`
        relative flex-shrink-0 transition-all duration-150 ease-out cursor-pointer
        ${isVideo(item) ? 'ring-2 ring-yellow-400 shadow-lg shadow-yellow-400/30' : ''}
      `}
      style={{
        width: `${160 * scale}px`,
        height: `${200 * scale}px`,
        transform: `scale(${scale})`,
        zIndex: isHovered ? 10 : 1,
      }}
      onMouseEnter={() => onHover(index)}
      onMouseLeave={() => onHover(null)}
      onClick={() => onClick(item)}
    >
      <div className="w-full h-full rounded-lg overflow-hidden bg-gray-200 relative">
        <img
          src={getImageSrc(item)}
          alt={item.description || 'Memory'}
          className="w-full h-full object-cover"
        />
        
        {/* Video indicator */}
        {isVideo(item) && (
          <div className="absolute top-2 right-2 bg-yellow-400 text-black px-2 py-1 rounded-full text-xs font-bold">
            VIDEO
          </div>
        )}
        
        {/* Hover overlay */}
        {isHovered && (
          <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent flex flex-col justify-end p-3">
            <div className="text-white text-sm">
              <p className="font-semibold truncate">{item.description || 'No description'}</p>
              <p className="text-xs opacity-75">{item.date}</p>
              {item.tags.length > 0 && (
                <div className="flex flex-wrap gap-1 mt-1">
                  {item.tags.slice(0, 3).map((tag, i) => (
                    <span key={i} className="bg-blue-500 px-1 py-0.5 rounded text-xs">
                      {tag}
                    </span>
                  ))}
                  {item.tags.length > 3 && (
                    <span className="text-xs opacity-75">+{item.tags.length - 3}</span>
                  )}
                </div>
              )}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

interface DetailModalProps {
  item: SnapshotItem | null;
  onClose: () => void;
}

const DetailModal: React.FC<DetailModalProps> = ({ item, onClose }) => {
  // Always call ALL hooks first, before any early returns
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentFrame, setCurrentFrame] = useState(0);
  const [canvasReady, setCanvasReady] = useState(false);
  const intervalRef = useRef<NodeJS.Timeout | null>(null);

  // Video playback functions
  const playVideo = useCallback(() => {
    if (!item || !isVideo(item)) return;
    
    setIsPlaying(true);
    const frameRate = 30;
    const frameInterval = 1000 / frameRate;
    
    intervalRef.current = setInterval(() => {
      setCurrentFrame((prev) => (prev + 1) % item.frames.length);
    }, frameInterval);
  }, [item]);

  const pauseVideo = useCallback(() => {
    setIsPlaying(false);
    if (intervalRef.current) {
      clearInterval(intervalRef.current);
      intervalRef.current = null;
    }
  }, []);

  const togglePlayback = useCallback(() => {
    if (isPlaying) {
      pauseVideo();
    } else {
      playVideo();
    }
  }, [isPlaying, playVideo, pauseVideo]);

  // Load and display video frames
  const loadFrame = useCallback((frameIndex: number) => {
    if (!item || !isVideo(item) || !canvasRef.current || item.frames.length === 0) {
      console.log('loadFrame early return:', { item: !!item, isVideo: item ? isVideo(item) : false, canvas: !!canvasRef.current, framesLength: item?.frames?.length });
      return;
    }

    console.log('Loading frame:', frameIndex, 'of', item.frames.length);
    const canvas = canvasRef.current;
    const ctx = canvas.getContext('2d');
    if (!ctx) {
      console.error('No canvas context');
      return;
    }

    const img = new Image();
    img.crossOrigin = 'anonymous';
    
    // Frames are already base64 encoded, check if they have data URI prefix
    const frameSrc = item.frames[frameIndex].startsWith('data:') 
      ? item.frames[frameIndex] 
      : `data:image/jpeg;base64,${item.frames[frameIndex]}`;
    
    console.log('Frame source length:', frameSrc.length, 'starts with data:', frameSrc.startsWith('data:'));
    
    img.onload = () => {
      console.log('Frame loaded successfully, image dimensions:', img.width, 'x', img.height);
      // Set canvas size to match image aspect ratio
      const maxWidth = 800;
      const maxHeight = 600;
      const aspectRatio = img.width / img.height;
      
      let canvasWidth, canvasHeight;
      if (aspectRatio > maxWidth / maxHeight) {
        canvasWidth = maxWidth;
        canvasHeight = maxWidth / aspectRatio;
      } else {
        canvasHeight = maxHeight;
        canvasWidth = maxHeight * aspectRatio;
      }
      
      canvas.width = canvasWidth;
      canvas.height = canvasHeight;
      
      // Clear canvas and draw the image
      ctx.clearRect(0, 0, canvasWidth, canvasHeight);
      ctx.drawImage(img, 0, 0, canvasWidth, canvasHeight);
      
      console.log('Canvas updated, size:', canvasWidth, 'x', canvasHeight, 'ready:', true);
      // Mark canvas as ready after any frame loads
      setCanvasReady(true);
    };
    
    img.onerror = () => {
      console.error('Failed to load video frame:', frameIndex, 'Source:', frameSrc.substring(0, 50) + '...');
    };
    
    img.src = frameSrc;
  }, [item]);

  // Load current frame when it changes
  useEffect(() => {
    loadFrame(currentFrame);
  }, [currentFrame, loadFrame]);

  // Initialize with first frame when item changes
  useEffect(() => {
    if (!item || !isVideo(item) || item.frames.length === 0) return;
    
    setCanvasReady(false);
    setCurrentFrame(0);
    
    // Load first frame immediately
    const timeoutId = setTimeout(() => {
      loadFrame(0);
    }, 10);
    
    return () => clearTimeout(timeoutId);
  }, [item, loadFrame]);

  // Reset playback state when item changes
  useEffect(() => {
    setIsPlaying(false);
    if (intervalRef.current) {
      clearInterval(intervalRef.current);
      intervalRef.current = null;
    }
  }, [item]);

  // Cleanup effect
  useEffect(() => {
    return () => {
      if (intervalRef.current) {
        clearInterval(intervalRef.current);
      }
    };
  }, []);

  // Early return AFTER all hooks
  if (!item) return null;

  return (
    <div 
      className="fixed inset-0 z-50 flex items-center justify-center p-4"
      onClick={(e) => {
        if (e.target === e.currentTarget) {
          onClose();
        }
      }}
    >
      {/* Backdrop */}
      <div className="absolute inset-0 bg-black/60 backdrop-blur-sm" />
      
      {/* Dialog */}
      <div className="relative bg-white rounded-2xl shadow-2xl max-w-7xl w-full max-h-[90vh] overflow-hidden animate-in fade-in-0 zoom-in-95 duration-200">
        <div className="flex flex-col h-full">
          {/* Header */}
          <div className="flex justify-between items-center p-6 border-b border-gray-200 bg-gradient-to-r from-blue-50 to-purple-50">
            <h2 className="text-2xl font-bold text-gray-800">
              {isVideo(item) ? '🎥 Video Memory' : '📸 Photo Memory'}
            </h2>
            <button
              onClick={onClose}
              className="p-2 hover:bg-white/50 rounded-full transition-colors text-gray-500 hover:text-gray-700"
            >
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
          
          {/* Content */}
          <div className="flex-1 overflow-auto">
            <div className="grid grid-cols-1 xl:grid-cols-3 gap-6 p-6">
              {/* Media Display */}
              <div className="xl:col-span-2 space-y-4">
              {isVideo(item) ? (
                <div className="space-y-2">
                  <div className="bg-white rounded-lg p-4 aspect-video flex items-center justify-center relative min-h-[400px]">
                    {!canvasReady && (
                      <div className="flex items-center justify-center w-full h-full">
                        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                      </div>
                    )}
                    <canvas
                      ref={canvasRef}
                      className={`max-w-full max-h-full object-contain rounded transition-opacity duration-200 ${
                        canvasReady ? 'opacity-100' : 'opacity-0'
                      }`}
                    />
                    {canvasReady && !isPlaying && (
                      <button
                        onClick={togglePlayback}
                        className="absolute inset-0 flex items-center justify-center bg-black bg-opacity-30 hover:bg-opacity-50 transition-opacity rounded"
                      >
                        <div className="bg-white rounded-full p-3 shadow-lg">
                          <svg className="w-6 h-6 text-gray-800" fill="currentColor" viewBox="0 0 20 20">
                            <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" clipRule="evenodd" />
                          </svg>
                        </div>
                      </button>
                    )}
                    {canvasReady && isPlaying && (
                      <button
                        onClick={togglePlayback}
                        className="absolute top-2 right-2 bg-black bg-opacity-50 hover:bg-opacity-70 rounded-full p-2 transition-opacity"
                      >
                        <svg className="w-4 h-4 text-white" fill="currentColor" viewBox="0 0 20 20">
                          <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zM7 8a1 1 0 012 0v4a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v4a1 1 0 102 0V8a1 1 0 00-1-1z" clipRule="evenodd" />
                        </svg>
                      </button>
                    )}
                  </div>
                  <div className="text-sm text-gray-600">
                    <p>Duration: {item.duration.toFixed(1)}s</p>
                    <p>FPS: {item.fps}</p>
                    <p>Frames: {item.frames.length}</p>
                    <p>Frame: {currentFrame + 1} / {item.frames.length}</p>
                  </div>
                </div>
              ) : (
                <img
                  src={item.imageUrl}
                  alt={item.description || 'Memory'}
                  className="w-full rounded-lg"
                />
              )}
            </div>
            
            {/* Details */}
            <div className="space-y-4">
              <div>
                <h3 className="font-semibold text-gray-700 mb-2">Description</h3>
                <p className="text-gray-600">{item.description || 'No description available'}</p>
              </div>
              
              <div>
                <h3 className="font-semibold text-gray-700 mb-2">Date</h3>
                <p className="text-gray-600">{item.date}</p>
              </div>
              
              {item.location && (
                <div>
                  <h3 className="font-semibold text-gray-700 mb-2">Location</h3>
                  <p className="text-gray-600">{item.location}</p>
                </div>
              )}
              
              {item.tags.length > 0 && (
                <div>
                  <h3 className="font-semibold text-gray-700 mb-2">Tags</h3>
                  <div className="flex flex-wrap gap-2">
                    {item.tags.map((tag, index) => (
                      <span
                        key={index}
                        className="bg-blue-100 text-blue-800 px-2 py-1 rounded-full text-sm"
                      >
                        {tag}
                      </span>
                    ))}
                  </div>
                </div>
              )}
              
              {isVideo(item) && item.transcription && (
                <div>
                  <h3 className="font-semibold text-gray-700 mb-2">Audio Transcript</h3>
                  <div className="bg-gray-50 p-3 rounded-lg">
                    <p className="text-gray-700 text-sm">{item.transcription}</p>
                  </div>
                </div>
              )}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

interface ConcatenatedVideoPlayerProps {
  videos: MemoryVideo[];
}

const ConcatenatedVideoPlayer: React.FC<ConcatenatedVideoPlayerProps> = ({ videos }) => {
  const [isPlaying, setIsPlaying] = useState(false);
  const [isTransitioning, setIsTransitioning] = useState(false);
  const intervalRef = useRef<NodeJS.Timeout | null>(null);
  const fadeTimeoutRef = useRef<NodeJS.Timeout | null>(null);

  // Create a flattened list of all frames with video metadata
  const allFrames = React.useMemo(() => {
    const frames: Array<{ frame: string; videoIndex: number; frameIndex: number; videoId: string }> = [];
    videos.forEach((video, videoIndex) => {
      if (video.frames && video.frames.length > 0) {
        video.frames.forEach((frame, frameIndex) => {
          frames.push({ frame, videoIndex, frameIndex, videoId: video.id });
        });
      }
    });
    return frames;
  }, [videos]);

  const [globalFrameIndex, setGlobalFrameIndex] = useState(0);

  // Use the same frame source logic as the carousel
  const getFrameSrc = useCallback((frame: string): string => {
    return frame.startsWith('data:') ? frame : `data:image/jpeg;base64,${frame}`;
  }, []);

  const playVideo = useCallback(() => {
    if (allFrames.length === 0) return;
    
    setIsPlaying(true);
    const frameRate = 24;
    const frameInterval = 1000 / frameRate;
    
    intervalRef.current = setInterval(() => {
      setGlobalFrameIndex(prev => {
        const nextIndex = (prev + 1) % allFrames.length;
        const currentFrame = allFrames[prev];
        const nextFrame = allFrames[nextIndex];
        
        // Check if we're transitioning between different videos
        if (currentFrame && nextFrame && currentFrame.videoIndex !== nextFrame.videoIndex) {
          setIsTransitioning(true);
          if (fadeTimeoutRef.current) clearTimeout(fadeTimeoutRef.current);
          fadeTimeoutRef.current = setTimeout(() => {
            setIsTransitioning(false);
          }, 500);
        }
        
        return nextIndex;
      });
    }, frameInterval);
  }, [allFrames]);

  const pauseVideo = useCallback(() => {
    setIsPlaying(false);
    if (intervalRef.current) {
      clearInterval(intervalRef.current);
      intervalRef.current = null;
    }
  }, []);

  const togglePlayback = useCallback(() => {
    if (isPlaying) {
      pauseVideo();
    } else {
      playVideo();
    }
  }, [isPlaying, playVideo, pauseVideo]);

  // Cleanup
  useEffect(() => {
    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current);
      if (fadeTimeoutRef.current) clearTimeout(fadeTimeoutRef.current);
    };
  }, []);

  if (videos.length === 0) {
    return (
      <div className="bg-white rounded-2xl shadow-lg p-8 text-center">
        <p className="text-gray-500">No videos available for the movie player</p>
      </div>
    );
  }

  const currentFrame = allFrames[globalFrameIndex];
  const currentVideo = currentFrame ? videos[currentFrame.videoIndex] : null;

  return (
    <div className="bg-white rounded-2xl shadow-lg overflow-hidden">
      {/* Header */}
      <div className="bg-gradient-to-r from-purple-600 to-blue-600 text-white p-4">
        <h2 className="text-2xl font-bold">🎬 Your Memory Movie</h2>
        <p className="text-purple-100">
          {allFrames.length} frames from {videos.length} videos
          {currentVideo && (
            <span className="ml-2">• Now playing: {currentVideo.description || `Video ${currentFrame.videoIndex + 1}`}</span>
          )}
        </p>
      </div>

      {/* Video Player */}
      <div className="relative bg-black">
        <div className="flex items-center justify-center p-4 min-h-[400px]">
          {allFrames.length > 0 && allFrames[globalFrameIndex] && (
            <img
              src={getFrameSrc(allFrames[globalFrameIndex].frame)}
              alt={`Frame ${globalFrameIndex + 1}`}
              className={`max-w-full max-h-full object-contain rounded transition-all duration-500 ${
                isTransitioning ? 'opacity-50 scale-105' : 'opacity-100 scale-100'
              }`}
              onError={() => {
                console.error('Frame load error:', {
                  frameIndex: globalFrameIndex,
                  frameSrc: getFrameSrc(allFrames[globalFrameIndex].frame),
                  frameData: allFrames[globalFrameIndex].frame.substring(0, 50) + '...'
                });
              }}
              onLoad={() => {
                console.log('Frame loaded successfully:', globalFrameIndex);
              }}
            />
          )}
          
          {/* Play/Pause Button - Positioned in bottom right corner */}
          <button
            onClick={togglePlayback}
            className="absolute bottom-4 right-4 bg-white bg-opacity-90 hover:bg-opacity-100 rounded-full p-3 shadow-lg transition-all duration-200 hover:scale-110 z-10"
          >
            {isPlaying ? (
              <svg className="w-6 h-6 text-gray-800" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zM7 8a1 1 0 012 0v4a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v4a1 1 0 102 0V8a1 1 0 00-1-1z" clipRule="evenodd" />
              </svg>
            ) : (
              <svg className="w-6 h-6 text-gray-800" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" clipRule="evenodd" />
              </svg>
            )}
          </button>
        </div>

        {/* Progress Bar */}
        <div className="absolute bottom-0 left-0 right-0 bg-black bg-opacity-50 p-4">
          <div className="flex items-center gap-4 text-white text-sm">
            <span>{globalFrameIndex + 1} / {allFrames.length}</span>
            <div className="flex-1 bg-gray-600 rounded-full h-2">
              <div 
                className="bg-gradient-to-r from-purple-400 to-blue-400 h-2 rounded-full transition-all duration-200"
                style={{ width: `${((globalFrameIndex + 1) / allFrames.length) * 100}%` }}
              />
            </div>
            <span className="text-xs">
              {isTransitioning && "✨ Transitioning..."}
            </span>
          </div>
        </div>
      </div>
    </div>
  );
};

const SnapshotsPage: React.FC = () => {
  const { memories, loading: memoriesLoading, error: memoriesError } = useMemories();
  const { videos, loading: videosLoading, error: videosError } = useVideos();
  const [hoveredIndex, setHoveredIndex] = useState<number | null>(null);
  const [selectedItem, setSelectedItem] = useState<SnapshotItem | null>(null);
  const scrollContainerRef = useRef<HTMLDivElement>(null);
  const [scrollPosition, setScrollPosition] = useState(0);
  const [containerWidth, setContainerWidth] = useState(0);
  const [contentWidth, setContentWidth] = useState(0);
  const [isDragging, setIsDragging] = useState(false);
  const [dragStartX, setDragStartX] = useState(0);
  const [dragStartScrollPosition, setDragStartScrollPosition] = useState(0);

  const loading = memoriesLoading || videosLoading;
  const error = memoriesError || videosError;

  // Combine and sort all items by date
  const allItems: SnapshotItem[] = React.useMemo(() => 
    [...memories, ...videos].sort((a, b) => 
      new Date(b.date).getTime() - new Date(a.date).getTime()
    ), [memories, videos]
  );

  // Handle scroll events to update scroll position
  const handleScroll = useCallback((e: React.UIEvent<HTMLDivElement>) => {
    const container = e.currentTarget;
    const scrollLeft = container.scrollLeft;
    const maxScroll = container.scrollWidth - container.clientWidth;
    const scrollPercentage = maxScroll > 0 ? scrollLeft / maxScroll : 0;
    setScrollPosition(scrollPercentage);
  }, []);

  // Handle scrollbar thumb drag
  const handleThumbMouseDown = useCallback((e: React.MouseEvent) => {
    e.preventDefault();
    setIsDragging(true);
    setDragStartX(e.clientX);
    setDragStartScrollPosition(scrollPosition);
  }, [scrollPosition]);

  const handleMouseMove = useCallback((e: MouseEvent) => {
    if (!isDragging || !scrollContainerRef.current) return;
    
    const scrollbarWidth = scrollContainerRef.current.clientWidth;
    const thumbWidth = (containerWidth / contentWidth) * scrollbarWidth;
    const maxThumbPosition = scrollbarWidth - thumbWidth;
    
    const deltaX = e.clientX - dragStartX;
    const deltaPercentage = deltaX / maxThumbPosition;
    const newScrollPosition = Math.max(0, Math.min(1, dragStartScrollPosition + deltaPercentage));
    
    const maxScroll = contentWidth - containerWidth;
    const targetScroll = newScrollPosition * maxScroll;
    
    scrollContainerRef.current.scrollLeft = targetScroll;
    setScrollPosition(newScrollPosition);
  }, [isDragging, dragStartX, dragStartScrollPosition, containerWidth, contentWidth]);

  const handleMouseUp = useCallback(() => {
    setIsDragging(false);
  }, []);

  // Add global mouse event listeners for dragging
  useEffect(() => {
    if (isDragging) {
      document.addEventListener('mousemove', handleMouseMove);
      document.addEventListener('mouseup', handleMouseUp);
      return () => {
        document.removeEventListener('mousemove', handleMouseMove);
        document.removeEventListener('mouseup', handleMouseUp);
      };
    }
  }, [isDragging, handleMouseMove, handleMouseUp]);

  // Update dimensions when content changes
  useEffect(() => {
    if (scrollContainerRef.current && allItems.length > 0) {
      const updateDimensions = () => {
        if (scrollContainerRef.current) {
          setContainerWidth(scrollContainerRef.current.clientWidth);
          setContentWidth(scrollContainerRef.current.scrollWidth);
        }
      };
      
      // Update dimensions after a short delay to ensure content is rendered
      const timeoutId = setTimeout(updateDimensions, 100);
      
      // Add resize listener
      window.addEventListener('resize', updateDimensions);
      return () => {
        clearTimeout(timeoutId);
        window.removeEventListener('resize', updateDimensions);
      };
    }
  }, [allItems.length]);

  // Auto-scroll to end (most recent content) when data loads
  useEffect(() => {
    if (!loading && allItems.length > 0 && scrollContainerRef.current) {
      const timeoutId = setTimeout(() => {
        if (scrollContainerRef.current) {
          const maxScroll = scrollContainerRef.current.scrollWidth - scrollContainerRef.current.clientWidth;
          scrollContainerRef.current.scrollLeft = maxScroll;
          setScrollPosition(maxScroll > 0 ? 1 : 0);
        }
      }, 150);
      return () => clearTimeout(timeoutId);
    }
  }, [loading, allItems.length]);

  // Calculate scrollbar dimensions
  const scrollbarThumbWidth = containerWidth > 0 && contentWidth > 0 
    ? Math.max(20, (containerWidth / contentWidth) * 100) 
    : 20;
  const scrollbarThumbPosition = scrollPosition * (100 - scrollbarThumbWidth);

  if (loading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading your memories...</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 flex items-center justify-center">
        <div className="text-center">
          <p className="text-red-600 mb-4">Error loading memories: {error}</p>
          <button 
            onClick={() => window.location.reload()}
            className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700"
          >
            Retry
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50">
      <div className="container mx-auto px-4 py-8">
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold text-gray-800 mb-2">Your Timeline</h1>
          <p className="text-gray-600">
            Explore your captured memories • {memories.length} photos • {videos.length} videos
          </p>
        </div>

        {allItems.length === 0 ? (
          <div className="text-center py-16">
            <p className="text-gray-500 text-lg">No memories found. Start capturing some moments!</p>
          </div>
        ) : (
          <div className="space-y-8">
            {/* Row 1: Carousel */}
            <div className="relative">
              <h2 className="text-2xl font-bold text-gray-800 mb-4">📸 Memory Timeline</h2>
              <div 
                ref={scrollContainerRef} 
                className="overflow-x-auto pb-8 scrollbar-thin scrollbar-thumb-gray-300 scrollbar-track-gray-100"
                onScroll={handleScroll}
              >
                <div 
                  className="flex gap-4 px-8"
                  style={{ width: `${allItems.length * 180}px` }}
                >
                  {allItems.map((item, index) => (
                    <CarouselItem
                      key={item.id}
                      item={item}
                      index={index}
                      hoveredIndex={hoveredIndex}
                      onHover={setHoveredIndex}
                      onClick={setSelectedItem}
                    />
                  ))}
                </div>
              </div>
              {/* Interactive scrollbar indicator */}
              <div className="mt-4">
                <div 
                  className="w-full h-3 bg-gray-200 rounded-full mx-auto cursor-pointer relative" 
                  style={{width: 'calc(100% - 4rem)'}}
                  onClick={(e) => {
                    if (scrollContainerRef.current && contentWidth > containerWidth) {
                      const rect = e.currentTarget.getBoundingClientRect();
                      const clickX = e.clientX - rect.left;
                      const clickPercentage = clickX / rect.width;
                      const maxScroll = contentWidth - containerWidth;
                      const targetScroll = clickPercentage * maxScroll;
                      scrollContainerRef.current.scrollLeft = targetScroll;
                    }
                  }}
                >
                  <div 
                    className={`h-full bg-blue-500 rounded-full transition-all duration-150 absolute top-0 cursor-grab ${
                      isDragging ? 'cursor-grabbing bg-blue-600 scale-110' : 'hover:bg-blue-600'
                    }`}
                    style={{
                      width: `${scrollbarThumbWidth}%`,
                      left: `${scrollbarThumbPosition}%`
                    }}
                    onMouseDown={handleThumbMouseDown}
                  />
                </div>
              </div>
            </div>

            {/* Row 2: Concatenated Video Player */}
            <div>
              <ConcatenatedVideoPlayer videos={videos} />
            </div>
          </div>
        )}
      </div>

      <DetailModal 
        item={selectedItem} 
        onClose={() => setSelectedItem(null)} 
      />
    </div>
  );
};

export default SnapshotsPage;
