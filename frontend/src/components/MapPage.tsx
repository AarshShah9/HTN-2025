import 'leaflet/dist/leaflet.css';
import React, { useEffect, useMemo, useState } from 'react';
import { MapContainer, Marker, Popup, TileLayer } from 'react-leaflet';
import L from 'leaflet';
import { useMemories } from '@/hooks';
import { MemoryError, MemoryLoading } from './index';
import { Button } from './ui/button';
import { Dialog, DialogContent, DialogTrigger } from './ui/dialog';
import { Badge } from './ui/badge';
import { Calendar, ChevronLeft, ChevronRight, MapPin } from 'lucide-react';
import type { MemoryImage } from '@/lib/types';

// Fix for default markers in react-leaflet
delete (L.Icon.Default.prototype as unknown as { _getIconUrl?: unknown })._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/images/marker-icon-2x.png',
  iconUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/images/marker-icon.png',
  shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/images/marker-shadow.png',
});

// Create a custom icon for memory markers
const createMemoryIcon = (imageUrl: string) => {
  return L.divIcon({
    html: `
      <div class="memory-marker">
        <div class="memory-marker-inner">
          <img src="${imageUrl}" alt="Memory" class="memory-marker-image" />
        </div>
      </div>
    `,
    className: 'custom-memory-marker',
    iconSize: [40, 40],
    iconAnchor: [20, 20],
    popupAnchor: [0, -20],
  });
};

// Create a custom cluster icon for multiple memories at the same location
const createClusterIcon = (imageUrl: string, count: number) => {
  return L.divIcon({
    html: `
      <div class="memory-cluster-marker">
        <div class="memory-marker-inner">
          <img src="${imageUrl}" alt="Memory" class="memory-marker-image" />
        </div>
        <div class="memory-count-badge">${count}</div>
      </div>
    `,
    className: 'custom-memory-marker',
    iconSize: [30, 30],
    iconAnchor: [24, 24],
    popupAnchor: [0, -30],
  });
};

// Group memories by exact location
type LocationGroup = {
  lat: number;
  lng: number;
  memories: MemoryImage[];
};

const groupMemoriesByLocation = (memories: MemoryImage[]): LocationGroup[] => {
  const locationMap = new Map<string, LocationGroup>();
  
  memories.forEach(memory => {
    console.log(memory);
    if (memory.latitude !== undefined && memory.longitude !== undefined) {
      const key = `${memory.latitude.toFixed(6)},${memory.longitude.toFixed(6)}`;
      
      if (locationMap.has(key)) {
        locationMap.get(key)!.memories.push(memory);
      } else {
        locationMap.set(key, {
          lat: memory.latitude,
          lng: memory.longitude,
          memories: [memory]
        });
      }
    }
  });
  
  return Array.from(locationMap.values());
};

const MapPage: React.FC = () => {
  const { memories, loading, error, refetch } = useMemories();
  const [_, setSelectedMemory] = useState<string | null>(null);
  const [currentMemoryIndex, setCurrentMemoryIndex] = useState<{ [key: string]: number }>({});
  const [latitude, setLatitude] = useState(0);
  const [longitude, setLongitude] = useState(0);
  useEffect(() => {
    navigator.geolocation.getCurrentPosition((position) => {
      setLatitude(position.coords.latitude);
      setLongitude(position.coords.longitude);
    });
  }, []);
  // Filter memories that have location data
  const memoriesWithLocation = useMemo(() => {
    return memories.filter(memory => 
      memory.latitude !== undefined && 
      memory.longitude !== undefined &&
      !isNaN(memory.latitude) && 
      !isNaN(memory.longitude)
    );
  }, [memories]);

  // Group memories by location
  const locationGroups = useMemo(() => {
    return groupMemoriesByLocation(memoriesWithLocation);
  }, [memoriesWithLocation]);

  // Calculate map center based on all memories
  const mapCenter = useMemo(() => {
    if (memoriesWithLocation.length === 0) {
      return [latitude, longitude];
    }
    
    const avgLat = memoriesWithLocation.reduce((sum, memory) => sum + memory.latitude!, 0) / memoriesWithLocation.length;
    const avgLng = memoriesWithLocation.reduce((sum, memory) => sum + memory.longitude!, 0) / memoriesWithLocation.length;
    
    return [avgLat, avgLng];
  }, [memoriesWithLocation, latitude, longitude]);

  // Calculate appropriate zoom level based on the spread of locations
  const calculateZoom = () => {
    if (memoriesWithLocation.length <= 1) return 13;
    
    const lats = memoriesWithLocation.map(m => m.latitude!);
    const lngs = memoriesWithLocation.map(m => m.longitude!);
    
    const latRange = Math.max(...lats) - Math.min(...lats);
    const lngRange = Math.max(...lngs) - Math.min(...lngs);
    const maxRange = Math.max(latRange, lngRange);
    
    if (maxRange > 10) return 4;
    if (maxRange > 5) return 6;
    if (maxRange > 2) return 8;
    if (maxRange > 1) return 10;
    if (maxRange > 0.5) return 11;
    return 12;
  };

  // Get current memory for a location group
  const getCurrentMemory = (locationKey: string, memories: MemoryImage[]) => {
    const index = currentMemoryIndex[locationKey] || 0;
    return memories[index];
  };

  // Navigate to next/previous memory in a cluster
  const navigateMemory = (locationKey: string, memories: MemoryImage[], direction: 'next' | 'prev') => {
    const currentIndex = currentMemoryIndex[locationKey] || 0;
    let newIndex;
    
    if (direction === 'next') {
      newIndex = (currentIndex + 1) % memories.length;
    } else {
      newIndex = currentIndex === 0 ? memories.length - 1 : currentIndex - 1;
    }
    
    setCurrentMemoryIndex(prev => ({
      ...prev,
      [locationKey]: newIndex
    }));
  };

  if (loading) {
    return (
      <div className="container mx-auto px-4 py-8">
        <MemoryLoading />
      </div>
    );
  }

  if (error) {
    return (
      <div className="container mx-auto px-4 py-8">
        <MemoryError message={error} onRetry={refetch} />
      </div>
    );
  }

  return (
    <div className="container mx-auto px-4 py-6">
      <div className="mb-6">
        <h1 className="text-3xl font-bold mb-2">Memory Map</h1>
        <p className="text-muted-foreground">
          Explore your memories on the map • {memoriesWithLocation.length} memories with location data
        </p>
      </div>

      {memoriesWithLocation.length === 0 ? (
        <div className="text-center py-12">
          <MapPin className="h-12 w-12 text-muted-foreground mx-auto mb-4" />
          <h3 className="text-lg font-semibold mb-2">No Memories with Location Data</h3>
          <p className="text-muted-foreground">
            Upload some memories with location information to see them on the map.
          </p>
        </div>
      ) : (
        <div className="relative">
          <div className="h-[calc(100vh-200px)] min-h-[600px] rounded-lg overflow-hidden border shadow-lg">
            <MapContainer
              center={mapCenter as [number, number]}
              zoom={calculateZoom()}
              style={{ height: '100%', width: '100%' }}
              zoomControl={true}
              className="z-0"
            >
              <TileLayer
                attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
              />
              
              {locationGroups.map((locationGroup) => {
                const locationKey = `${locationGroup.lat.toFixed(6)},${locationGroup.lng.toFixed(6)}`;
                const currentMemory = getCurrentMemory(locationKey, locationGroup.memories);
                const isCluster = locationGroup.memories.length > 1;
                
                return (
                  <Marker
                    key={locationKey}
                    position={[locationGroup.lat, locationGroup.lng]}
                    icon={isCluster 
                      ? createClusterIcon(currentMemory.imageUrl, locationGroup.memories.length)
                      : createMemoryIcon(currentMemory.imageUrl)
                    }
                    eventHandlers={{
                      click: () => setSelectedMemory(currentMemory.id),
                    }}
                  >
                    <Popup className="custom-popup no-close-button" minWidth={250} closeButton={false}>
                    <div className="p-2">
                      {/* Cluster navigation header */}
                      {isCluster && (
                        <div className="flex items-center justify-between mb-3 pb-2 border-b">
                          <div className="text-sm font-medium">
                            {(currentMemoryIndex[locationKey] || 0) + 1} of {locationGroup.memories.length} memories
                          </div>
                          <div className="flex items-center space-x-1">
                            <Button
                              size="sm"
                              variant="outline"
                              onClick={(e) => {
                                e.stopPropagation();
                                navigateMemory(locationKey, locationGroup.memories, 'prev');
                              }}
                              disabled={locationGroup.memories.length <= 1}
                              className="h-6 w-6 p-0"
                            >
                              <ChevronLeft className="h-3 w-3" />
                            </Button>
                            <Button
                              size="sm"
                              variant="outline"
                              onClick={(e) => {
                                e.stopPropagation();
                                navigateMemory(locationKey, locationGroup.memories, 'next');
                              }}
                              disabled={locationGroup.memories.length <= 1}
                              className="h-6 w-6 p-0"
                            >
                              <ChevronRight className="h-3 w-3" />
                            </Button>
                          </div>
                        </div>
                      )}

                      <div className="aspect-video mb-3 rounded overflow-hidden">
                        <img 
                          src={currentMemory.imageUrl} 
                          alt="Memory"
                          className="w-full h-full object-cover"
                        />
                      </div>
                      
                      <div className="space-y-2">
                        <div className="flex items-center text-sm text-muted-foreground">
                          <Calendar className="h-4 w-4 mr-1" />
                          {new Date(currentMemory.date).toLocaleDateString()}
                        </div>
                        
                        {currentMemory.location && (
                          <div className="flex items-center text-sm text-muted-foreground">
                            <MapPin className="h-4 w-4 mr-1" />
                            {currentMemory.location}
                          </div>
                        )}
                        
                        {currentMemory.tags && currentMemory.tags.length > 0 && (
                          <div className="flex flex-wrap gap-1 mt-2">
                            {currentMemory.tags.slice(0, 3).map((tag, index) => (
                              <Badge key={index} variant="secondary" className="text-xs">
                                {tag}
                              </Badge>
                            ))}
                            {currentMemory.tags.length > 3 && (
                              <Badge variant="outline" className="text-xs">
                                +{currentMemory.tags.length - 3} more
                              </Badge>
                            )}
                          </div>
                        )}
                        
                        {currentMemory.description && (
                          <div className="mt-3 pt-3 border-t">
                            <p className="text-sm text-muted-foreground line-clamp-2">
                              {currentMemory.description}
                            </p>
                          </div>
                        )}
                        
                        <Dialog>
                          <DialogTrigger asChild>
                            <Button size="sm" className="w-full mt-3">
                              View Details
                            </Button>
                          </DialogTrigger>
                          <DialogContent className="max-w-2xl">
                            <div className="space-y-4">
                              <div className="aspect-video rounded overflow-hidden">
                                <img 
                                  src={currentMemory.imageUrl} 
                                  alt="Memory"
                                  className="w-full h-full object-cover"
                                />
                              </div>
                              
                              <div className="space-y-3">
                                <div className="flex items-center justify-between">
                                  <div className="flex items-center text-sm text-muted-foreground">
                                    <Calendar className="h-4 w-4 mr-1" />
                                    {new Date(currentMemory.date).toLocaleDateString()}
                                  </div>
                                  
                                  {currentMemory.location && (
                                    <div className="flex items-center text-sm text-muted-foreground">
                                      <MapPin className="h-4 w-4 mr-1" />
                                      {currentMemory.location}
                                    </div>
                                  )}
                                </div>
                                {currentMemory.tags && currentMemory.tags.length > 0 && (
                                  <div className="flex flex-wrap gap-1">
                                    {currentMemory.tags.map((tag, index) => (
                                      <Badge key={index} variant="secondary">
                                        {tag}
                                      </Badge>
                                    ))}
                                  </div>
                                )}
                                
                                {currentMemory.description && (
                                  <div className="pt-3 border-t">
                                    <h4 className="font-semibold mb-2">Transcript</h4>
                                    <p className="text-sm text-muted-foreground">
                                      {currentMemory.description}
                                    </p>
                                  </div>
                                )}
                              </div>
                            </div>
                          </DialogContent>
                        </Dialog>
                      </div>
                    </div>
                  </Popup>
                </Marker>
                );
              })}
            </MapContainer>
          </div>
        </div>
      )}
      
      <style>{`
        .memory-marker {
          width: 40px;
          height: 40px;
          border-radius: 50%;
          border: 3px solid white;
          box-shadow: 0 2px 8px rgba(0,0,0,0.3);
          overflow: hidden;
          cursor: pointer;
          transition: transform 0.2s ease;
        }
        
        .memory-cluster-marker {
          width: 60px;
          height: 60px;
          border-radius: 50%;
          border: 3px solid white;
          box-shadow: 0 2px 8px rgba(0,0,0,0.3);
          overflow: hidden;
          cursor: pointer;
          transition: transform 0.2s ease;
          position: relative;
        }
        
        .memory-marker:hover,
        .memory-cluster-marker:hover {
          transform: scale(1.1);
        }
        
        .memory-marker-inner {
          width: 100%;
          height: 100%;
          border-radius: 50%;
          overflow: hidden;
        }
        
        .memory-marker-image {
          width: 100%;
          height: 100%;
          object-fit: cover;
        }
        
        .memory-count-badge {
          position: absolute;
          top: 5px;
          right: 5px;
          background: #ef4444;
          color: white;
          border-radius: 50%;
          width: 24px;
          height: 24px;
          display: flex;
          align-items: center;
          justify-content: center;
          font-size: 12px;
          font-weight: bold;
          border: 2px solid white;
          box-shadow: 0 1px 4px rgba(0,0,0,0.3);
        }
        
        .custom-memory-marker {
          background: none !important;
          border: none !important;
        }
        
        .custom-popup .leaflet-popup-content-wrapper {
          border-radius: 8px;
          padding: 0;
        }
        
        .custom-popup .leaflet-popup-content {
          margin: 0;
        }
        
        .line-clamp-2 {
          display: -webkit-box;
          -webkit-line-clamp: 2;
          -webkit-box-orient: vertical;
          overflow: hidden;
        }
      `}</style>
    </div>
  );
};

export default MapPage;
