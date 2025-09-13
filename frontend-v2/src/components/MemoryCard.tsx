import { Badge } from '@/components/ui/badge';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog';
import type { MemoryImage } from '@/lib/types';
import { fetchRecording, type AudioData } from '@/utils/fetchRecording';
import { Calendar, MapPin, Play, Users } from 'lucide-react';
import React, { useCallback, useEffect, useState } from 'react';
import { Map } from './index';

type MemoryCardProps = {
  memory: MemoryImage;
};

const MemoryCard: React.FC<MemoryCardProps> = ({ memory }) => {
  const [audioData, setAudioData] = useState<AudioData | null>(null);
  const [isLoadingAudio, setIsLoadingAudio] = useState(false);
  const [audioError, setAudioError] = useState<string | null>(null);

  const loadAudio = useCallback(async () => {
    if (audioData) return; // Already loaded

    setIsLoadingAudio(true);
    setAudioError(null);

    try {
      const data = await fetchRecording(memory.id);
      setAudioData(data);
    } catch (error) {
      setAudioError(error instanceof Error ? error.message : 'Failed to load audio');
    } finally {
      setIsLoadingAudio(false);
    }
  }, [audioData, memory.id]);

  useEffect(() => {
    // Load audio when component mounts
    loadAudio();
  }, [loadAudio]);

  return (
    <Dialog>
      <DialogTrigger asChild>
        <Card className="cursor-pointer hover:shadow-lg transition-shadow duration-200 overflow-hidden group">
          <div className="aspect-video relative overflow-hidden">
            <img
              src={memory.imageUrl}
              alt={memory.title}
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-200"
            />
            {audioData && (
              <div className="absolute top-2 right-2 bg-black/50 rounded-full p-1">
                <Play className="w-4 h-4 text-white" />
              </div>
            )}
          </div>
          <CardHeader className="pb-2">
            <CardTitle className="text-lg line-clamp-1">{memory.title}</CardTitle>
            <CardDescription className="line-clamp-2">{memory.description}</CardDescription>
          </CardHeader>
          <CardContent className="pt-0">
            <div className="flex flex-wrap gap-1 mb-2">
              {memory.tags.slice(0, 3).map((tag) => (
                <Badge key={tag} variant="secondary" className="text-xs">
                  {tag}
                </Badge>
              ))}
              {memory.tags.length > 3 && (
                <Badge variant="outline" className="text-xs">
                  +{memory.tags.length - 3}
                </Badge>
              )}
            </div>
            <div className="flex items-center text-sm text-muted-foreground">
              <Calendar className="w-4 h-4 mr-1" />
              {new Date(memory.date).toLocaleDateString()}
            </div>
          </CardContent>
        </Card>
      </DialogTrigger>
      <DialogContent className="max-w-2xl max-h-[80vh] flex flex-col">
        <DialogHeader className="flex-shrink-0">
          <DialogTitle className="text-2xl">{memory.title}</DialogTitle>
          <DialogDescription className="text-base">{memory.description}</DialogDescription>
        </DialogHeader>
        <div className="flex-1 overflow-y-scroll space-y-4 pr-2">
          <img
            src={memory.imageUrl}
            alt={memory.title}
            className="w-full h-64 object-cover rounded-lg"
          />

          {/* Audio Player Section */}
          {audioData && (
            <div className="space-y-2">
              <h3 className="text-sm font-medium">Audio Recording</h3>
              <audio
                controls
                className="w-full"
                preload="metadata"
              >
                <source src={audioData.url} type={audioData.type} />
                Your browser does not support the audio element.
              </audio>
            </div>
          )}

          {isLoadingAudio && (
            <div className="text-sm text-muted-foreground">
              Loading audio...
            </div>
          )}

          {audioError && (
            <div className="text-sm text-red-500">
              Error loading audio: {audioError}
            </div>
          )}

          <div className="grid grid-cols-2 gap-4 text-sm">
            <div className="flex items-center">
              <Calendar className="w-4 h-4 mr-2 text-muted-foreground" />
              <span>{new Date(memory.date).toLocaleDateString('en-US', {
                year: 'numeric',
                month: 'long',
                day: 'numeric'
              })}</span>
            </div>
            {memory.location && (
              <div className="flex items-center">
                <MapPin className="w-4 h-4 mr-2 text-muted-foreground" />
                <span>{memory.location}</span>
              </div>
            )}
          </div>

          {/* Map Section */}
          {memory.latitude && memory.longitude && (
            <div className="space-y-2">
              <h3 className="text-sm font-medium">Location</h3>
              <Map
                latitude={memory.latitude}
                longitude={memory.longitude}
                location={memory.location}
                height="250px"
              />
            </div>
          )}
          {memory.people && memory.people.length > 0 && (
            <div className="flex items-start">
              <Users className="w-4 h-4 mr-2 mt-0.5 text-muted-foreground" />
              <div>
                <span className="text-sm font-medium">People: </span>
                <span className="text-sm text-muted-foreground">
                  {memory.people.join(', ')}
                </span>
              </div>
            </div>
          )}
          <div>
            <span className="text-sm font-medium">Tags: </span>
            <div className="flex flex-wrap gap-1 mt-1">
              {memory.tags.map((tag) => (
                <Badge key={tag} variant="secondary">
                  {tag}
                </Badge>
              ))}
            </div>
          </div>
        </div>
      </DialogContent>
    </Dialog>
  );
};

export default MemoryCard;