import { useMemories, useMemorySearch } from '@/hooks';
import React from 'react';
import { MemoryError, MemoryGrid, MemoryLoading, MemorySearch, MemoryStats } from './index';

const MemoryGallery: React.FC = () => {
  const { memories, loading, error, refetch } = useMemories();
  const {
    searchTerm,
    setSearchTerm,
    selectedTags,
    setSelectedTags,
    sortOrder,
    setSortOrder,
    filteredMemories,
    totalCount,
    filteredCount,
    totalTags,
    totalLocations,
    availableTags,
    isSemanticSearching,
    semanticSearchError
  } = useMemorySearch(memories);

  const handleSearchChange = (term: string) => {
    setSearchTerm(term);
  };

  const handleTagToggle = (tag: string) => {
    setSelectedTags(
      selectedTags.includes(tag)
        ? selectedTags.filter(t => t !== tag)
        : [...selectedTags, tag]
    );
  };

  const handleClearAllTags = () => {
    setSelectedTags([]);
  };

  const handleSortChange = (order: 'asc' | 'desc') => {
    setSortOrder(order);
  };

  const getEmptyMessage = () => {
    if (searchTerm.trim() || selectedTags.length > 0) {
      return `No memories found matching your filters.`;
    }
    return "No memories found.";
  };

  return (
    <div className="container mx-auto px-4 py-8">
      <div className="text-center mb-8">
        <h1 className="text-3xl font-bold mb-2">Memory Gallery</h1>
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
              selectedTags={selectedTags}
              onTagToggle={handleTagToggle}
              onClearAllTags={handleClearAllTags}
              sortOrder={sortOrder}
              onSortChange={handleSortChange}
              availableTags={availableTags}
              isSemanticSearching={isSemanticSearching}
              semanticSearchError={semanticSearchError}
            />

            <MemoryStats
              totalCount={totalCount}
              filteredCount={filteredCount}
              totalTags={totalTags}
              totalLocations={totalLocations}
              searchTerm={searchTerm}
            />

            <MemoryGrid
              memories={filteredMemories}
              emptyMessage={getEmptyMessage()}
            />
          </>
        )}
    </div>
  );
};

export default MemoryGallery;