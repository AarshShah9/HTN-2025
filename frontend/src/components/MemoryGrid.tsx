import type { MemoryImage } from '@/lib/types';
import React, { useMemo } from 'react';
import MemoryCard from './MemoryCard';
import ImageFolder from './ImageFolder';

type MemoryGridProps = {
  memories: MemoryImage[];
  emptyMessage?: string;
  similarityThreshold?: number; // Time threshold in milliseconds (default: 1 hour)
  minGroupSize?: number; // Minimum number of similar memories to create a folder
};

// Check if two memories are similar based on time and tags
const areMemoriesSimilar = (
  a: MemoryImage, 
  b: MemoryImage, 
  timeThreshold: number
): boolean => {
  // Check if memories are from the same time period
  const timeDiff = Math.abs(new Date(a.date).getTime() - new Date(b.date).getTime());
  if (timeDiff > timeThreshold) return false;
  
  // Check if either memory has no tags
  if (a.tags.length === 0 || b.tags.length === 0) return false;
  
  // Calculate tag overlap percentage
  const commonTags = a.tags.filter(tag => b.tags.includes(tag));
  const minTags = Math.min(a.tags.length, b.tags.length);
  const overlapPercentage = (commonTags.length / minTags) * 100;
  
  // Require at least 80% tag overlap
  return overlapPercentage >= 80;
};

// Group similar memories together
const groupSimilarMemories = (
  memories: MemoryImage[], 
  timeThreshold: number,
  minGroupSize: number
): (MemoryImage | MemoryImage[])[] => {
  if (memories.length === 0) return [];
  
  const result: (MemoryImage | MemoryImage[])[] = [];
  const usedIndices = new Set<number>();
  
  // Sort memories by date to group nearby memories
  const sortedMemories = [...memories].sort(
    (a, b) => new Date(a.date).getTime() - new Date(b.date).getTime()
  );
  
  for (let i = 0; i < sortedMemories.length; i++) {
    if (usedIndices.has(i)) continue;
    
    const currentMemory = sortedMemories[i];
    const similarGroup: MemoryImage[] = [currentMemory];
    
    // Find all similar memories that haven't been used yet
    for (let j = i + 1; j < sortedMemories.length; j++) {
      if (usedIndices.has(j)) continue;
      
      const otherMemory = sortedMemories[j];
      if (areMemoriesSimilar(currentMemory, otherMemory, timeThreshold)) {
        similarGroup.push(otherMemory);
        usedIndices.add(j);
      }
    }
    
    // Only group if we have the minimum number of similar memories
    if (similarGroup.length >= minGroupSize) {
      result.push(similarGroup);
    } else {
      // Add memories individually if not enough for a group
      similarGroup.forEach(memory => {
        if (memory === currentMemory) return; // Skip the current memory to avoid duplicates
        result.push(memory);
      });
      result.push(currentMemory);
    }
    
    usedIndices.add(i);
  }
  
  return result;
};

const MemoryGrid: React.FC<MemoryGridProps> = ({
  memories,
  emptyMessage = "No memories found.",
  similarityThreshold = 60 * 60 * 1000, // 1 hour in milliseconds
  minGroupSize = 2 // Minimum 2 memories to create a folder
}) => {
  // Group similar memories
  const groupedMemories = useMemo(() => {
    return groupSimilarMemories(memories, similarityThreshold, minGroupSize);
  }, [memories, similarityThreshold, minGroupSize]);

  if (memories.length === 0) {
    return (
      <div className="text-center py-12">
        <p className="text-muted-foreground text-lg">
          {emptyMessage}
        </p>
      </div>
    );
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
      {groupedMemories.map((item, index) => {
        if (Array.isArray(item)) {
          // Render a folder for grouped memories
          return <ImageFolder key={`folder-${index}`} memories={item} />;
        } else {
          // Render a single memory card
          return <MemoryCard key={item.id} memory={item} />;
        }
      })}
    </div>
  );
};

export default MemoryGrid;