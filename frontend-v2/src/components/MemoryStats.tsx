import React from 'react';

type MemoryStatsProps = {
  totalCount: number;
  filteredCount: number;
  searchTerm?: string;
};

const MemoryStats: React.FC<MemoryStatsProps> = ({
  totalCount,
  filteredCount,
  searchTerm
}) => {
  const isSearching = searchTerm && searchTerm.trim().length > 0;

  return (
    <div className="text-center mb-6 text-muted-foreground">
      <p>
        {isSearching ? (
          <>
            Found <span className="font-medium text-foreground">{filteredCount}</span> of{' '}
            <span className="font-medium text-foreground">{totalCount}</span> memories
          </>
        ) : (
          <>
            <span className="font-medium text-foreground">{totalCount}</span>{' '}
            {totalCount === 1 ? 'memory' : 'memories'} in your collection
          </>
        )}
      </p>
    </div>
  );
};

export default MemoryStats;