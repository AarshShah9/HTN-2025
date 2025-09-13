import type { MemoryImage } from '@/lib/types';
import React from 'react';
import MemoryCard from './MemoryCard';

type MemoryGridProps = {
  memories: MemoryImage[];
  emptyMessage?: string;
};

const MemoryGrid: React.FC<MemoryGridProps> = ({
  memories,
  emptyMessage = "No memories found."
}) => {
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
      {memories.map((memory) => (
        <MemoryCard key={memory.id} memory={memory} />
      ))}
    </div>
  );
};

export default MemoryGrid;