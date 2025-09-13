import React from 'react';

type MemoryStatsProps = {
  totalCount: number;
  filteredCount: number;
  totalTags: number;
  totalLocations: number;
  searchTerm?: string;
};

const MemoryStats: React.FC<MemoryStatsProps> = ({
  totalCount,
  filteredCount,
  totalTags,
  totalLocations,
  searchTerm
}) => {
  const isSearching = searchTerm && searchTerm.trim().length > 0;

  return (
    <div className="text-center mb-6 text-muted-foreground">
      <p>
        {isSearching ? (
          <span className="font-medium text-foreground">{filteredCount}</span>
        ) : (
          <span className="font-medium text-foreground">{totalCount}</span>
        )}{' '}
        {isSearching ? 'memories found' : `${totalCount === 1 ? 'memory' : 'memories'}`}
        {', '}
        <span className="font-medium text-foreground">{totalTags}</span> {totalTags === 1 ? 'tag' : 'tags'}
        {', '}
        <span className="font-medium text-foreground">{totalLocations}</span> {totalLocations === 1 ? 'location' : 'locations'}
        {' in your collection'}
      </p>
    </div>
  );
};

export default MemoryStats;