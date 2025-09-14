import { Badge } from '@/components/ui/badge';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import type { MemoryImage } from '@/lib/types';
import { Calendar, Folder, MapPin } from 'lucide-react';
import React, { useState } from 'react';

interface ImageFolderProps {
  memories: MemoryImage[];
  maxStackSize?: number;
}

const ImageFolder: React.FC<ImageFolderProps> = ({ 
  memories 
}) => {
  const [isOpen, setIsOpen] = useState(false);
  const [selectedMemory, setSelectedMemory] = useState<MemoryImage | null>(null);
  
  if (memories.length === 0) return null;
  
  const mainMemory = memories[0];
  const remainingCount = Math.max(0, memories.length - 1);
  
  const handleImageClick = (memory: MemoryImage) => {
    setSelectedMemory(memory);
  };

  return (
    <>
      <div className="relative group cursor-pointer" onClick={() => setIsOpen(true)}>
        <div className="relative">
          {/* Main image container */}
          <div className="aspect-[4/3] rounded-lg overflow-hidden shadow-lg relative">
            {/* Main image */}
            <div className="absolute inset-0">
              <img
                src={mainMemory.imageUrl}
                alt="Memory preview"
                className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105"
              />
              
              {/* Folder indicator with count */}
              <div className="absolute top-2 left-2 z-10 flex items-center gap-1.5 bg-black/60 text-white text-xs font-medium px-2 py-1 rounded-full">
                <Folder className="w-3 h-3" />
                <span>{memories.length}</span>
              </div>
              
              {/* Bottom sheet peek */}
              <div className="absolute bottom-0 left-0 right-0 h-2 bg-white/50 rounded-b-lg z-10" />
              
              {/* Right sheet peek */}
              <div className="absolute top-2 right-0 bottom-2 w-1.5 bg-white/50 rounded-r-lg z-10" />
              
              {/* Hover overlay with full count */}
              <div className="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center">
                <div className="bg-white/90 text-foreground rounded-full px-4 py-2 text-sm font-medium shadow-lg flex items-center gap-2">
                  <Folder className="w-4 h-4" />
                  <span>View {memories.length} {memories.length === 1 ? 'item' : 'items'}</span>
                </div>
              </div>
              
              {remainingCount > 0 && (
                <div className="absolute bottom-3 right-3 bg-white/90 text-foreground rounded-full w-8 h-8 flex items-center justify-center text-sm font-bold shadow-lg border border-gray-200">
                  <span className="text-xs">+{remainingCount}</span>
                </div>
              )}
            </div>
            
            {/* Folder info */}
            <div className="absolute -bottom-1 left-0 right-0 bg-white/95 backdrop-blur-sm border-t border-gray-200/50 rounded-b-lg px-3 py-2 z-30 shadow-[0_-2px_4px_rgba(0,0,0,0.05)]">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-1.5">
                  <Folder className="w-4 h-4 text-primary flex-shrink-0" />
                  <span className="text-sm font-medium text-gray-800 truncate max-w-[120px]">
                    {mainMemory.tags[0] || 'Memories'}
                  </span>
                </div>
                <div className="flex items-center text-xs text-gray-500 bg-gray-100/80 px-2 py-0.5 rounded-full">
                  <Calendar className="w-3 h-3 mr-1" />
                  {new Date(mainMemory.date).toLocaleDateString(undefined, { month: 'short', day: 'numeric' })}
                </div>
              </div>
              <div className="flex flex-wrap gap-1 mt-1.5">
                {mainMemory.tags.slice(0, 2).map((tag) => (
                  <Badge key={tag} variant="secondary" className="text-xs bg-white/90 border border-gray-100 shadow-sm">
                    {tag}
                  </Badge>
                ))}
                {mainMemory.tags.length > 2 && (
                  <Badge variant="outline" className="text-xs bg-white/80">
                    +{mainMemory.tags.length - 2}
                  </Badge>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Folder content dialog */}
      <Dialog open={isOpen} onOpenChange={setIsOpen}>
        <DialogContent className="max-w-4xl max-h-[90vh] flex flex-col p-0 overflow-hidden">
          <DialogHeader className="px-6 pt-6 pb-4 border-b">
            <DialogTitle className="text-2xl">
              {remainingCount + 1} Similar Memories
            </DialogTitle>
          </DialogHeader>
          
          <div className="flex-1 overflow-y-auto p-6">
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {memories.map((memory) => (
                <div 
                  key={memory.id} 
                  className={`relative rounded-lg overflow-hidden border ${selectedMemory?.id === memory.id ? 'ring-2 ring-primary' : ''}`}
                  onClick={() => handleImageClick(memory)}
                >
                  <img
                    src={memory.imageUrl}
                    alt="Memory"
                    className="w-full h-40 object-cover cursor-pointer"
                  />
                  <div className="p-3">
                    <div className="text-sm font-medium mb-1">
                      {new Date(memory.date).toLocaleDateString()}
                    </div>
                    <div className="flex flex-wrap gap-1">
                      {memory.tags.slice(0, 2).map((tag) => (
                        <Badge key={tag} variant="secondary" className="text-xs">
                          {tag}
                        </Badge>
                      ))}
                      {memory.tags.length > 2 && (
                        <Badge variant="outline" className="text-xs">
                          +{memory.tags.length - 2}
                        </Badge>
                      )}
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
          
          {/* Selected memory details with close button */}
          {selectedMemory && (
            <div className="border-t p-6 bg-gray-50 relative">
              <button 
                onClick={() => setSelectedMemory(null)}
                className="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none"
              >
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="h-5 w-5">
                  <path d="M18 6 6 18" />
                  <path d="m6 6 12 12" />
                </svg>
                <span className="sr-only">Close</span>
              </button>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <img
                    src={selectedMemory.imageUrl}
                    alt="Selected memory"
                    className="w-full h-64 object-contain bg-white rounded-lg"
                  />
                </div>
                <div className="space-y-4">
                  <div>
                    <h3 className="font-medium mb-1">Date</h3>
                    <p className="text-sm text-muted-foreground">
                      {new Date(selectedMemory.date).toLocaleDateString('en-US', {
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit'
                      })}
                    </p>
                  </div>
                  
                  {selectedMemory.location && (
                    <div>
                      <h3 className="font-medium mb-1 flex items-center gap-2">
                        <MapPin className="w-4 h-4" />
                        Location
                      </h3>
                      <p className="text-sm text-muted-foreground">
                        {selectedMemory.location}
                      </p>
                    </div>
                  )}
                  
                  <div>
                    <h3 className="font-medium mb-1">Tags</h3>
                    <div className="flex flex-wrap gap-1">
                      {selectedMemory.tags.map((tag) => (
                        <Badge key={tag} variant="secondary">
                          {tag}
                        </Badge>
                      ))}
                    </div>
                  </div>
                  
                  {selectedMemory.description && (
                    <div>
                      <h3 className="font-medium mb-1">Description</h3>
                      <p className="text-sm text-muted-foreground">
                        {selectedMemory.description}
                      </p>
                    </div>
                  )}
                </div>
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>
    </>
  );
};

export default ImageFolder;
