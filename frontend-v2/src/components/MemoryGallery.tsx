import { useMemories, useMemorySearch } from '@/hooks';
import React from 'react';
import { MemoryError, MemoryGrid, MemoryLoading, MemorySearch, MemoryStats } from './index';

const MemoryGallery: React.FC = () => {
  const { memories, loading, error, refetch } = useMemories();
  const { searchTerm, setSearchTerm, filteredMemories, totalCount, filteredCount } = useMemorySearch(memories);

  const handleSearchChange = (term: string) => {
    setSearchTerm(term);
  };

  const getEmptyMessage = () => {
    if (searchTerm.trim()) {
      return `No memories found matching "${searchTerm}".`;
    }
    return "No memories found.";
  };

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="text-center mb-8">
          <h1 className="text-4xl font-bold mb-2">Memory App</h1>
          <p className="text-muted-foreground text-lg">
            Cherish your precious moments and memories
          </p>
        </div>

        {loading && <MemoryLoading />}

        {error && (
          <MemoryError
            message={error}
            onRetry={refetch}
          />
        )}

        {!loading && !error && (
          <>
            <MemorySearch
              searchTerm={searchTerm}
              onSearchChange={handleSearchChange}
            />

            <MemoryStats
              totalCount={totalCount}
              filteredCount={filteredCount}
              searchTerm={searchTerm}
            />

            <MemoryGrid
              memories={filteredMemories}
              emptyMessage={getEmptyMessage()}
            />
          </>
        )}
      </div>
    </div>
  );
};

export default MemoryGallery;