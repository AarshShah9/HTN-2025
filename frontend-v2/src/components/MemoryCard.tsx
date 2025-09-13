import { Badge } from '@/components/ui/badge';
import { Card, CardContent } from '@/components/ui/card';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog';
import type { MemoryImage } from '@/lib/types';
import { Calendar, MapPin } from 'lucide-react';
import React from 'react';
import { Map } from './index';

type MemoryCardProps = {
  memory: MemoryImage;
};

const MemoryCard: React.FC<MemoryCardProps> = ({ memory }) => {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Card className="cursor-pointer hover:shadow-lg transition-shadow duration-200 overflow-hidden group">
          <div className="aspect-video relative overflow-hidden">
            <img
              src={memory.imageUrl}
              alt="Memory image"
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-200"
            />
          </div>
          <CardContent className="pt-4">
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
          <DialogTitle className="text-2xl">Memory Details</DialogTitle>
        </DialogHeader>
        <div className="flex-1 overflow-y-scroll scrollbar-visible space-y-4 pr-2">
          <img
            src={memory.imageUrl}
            alt="Memory image"
            className="w-full h-64 object-cover rounded-lg"
          />

          {/* Transcription Section */}
          <div className="space-y-2">
            <h3 className="text-sm font-medium">Transcription</h3>
            <p className="text-sm text-muted-foreground bg-gray-50 p-3 rounded-lg">
              {memory.transcript}
            </p>
          </div>

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

          {/* Tags Section */}
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
        </div>
      </DialogContent>
    </Dialog>
  );
};

export default MemoryCard;