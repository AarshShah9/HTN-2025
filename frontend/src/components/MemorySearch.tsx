import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { AlertCircle, ArrowDown, ArrowUp, Filter, Loader2, Search, X } from 'lucide-react';
import React, { useState } from 'react';
import type { SortOrder } from '../hooks/useMemorySearch';

type MemorySearchProps = {
  searchTerm: string;
  onSearchChange: (term: string) => void;
  selectedTags: string[];
  onTagToggle: (tag: string) => void;
  onClearAllTags: () => void;
  sortOrder: SortOrder;
  onSortChange: (order: SortOrder) => void;
  availableTags: string[];
  placeholder?: string;
  isSemanticSearching?: boolean;
  semanticSearchError?: string | null;
};

const MemorySearch: React.FC<MemorySearchProps> = ({
  searchTerm,
  onSearchChange,
  selectedTags,
  onTagToggle,
  onClearAllTags,
  sortOrder,
  onSortChange,
  availableTags,
  placeholder = "Search memories...",
  isSemanticSearching = false,
  semanticSearchError = null
}) => {
  const [showTagFilter, setShowTagFilter] = useState(false);

  const handleClear = () => {
    onSearchChange('');
  };

  const handleTagClick = (tag: string) => {
    onTagToggle(tag);
  };

  const handleSortToggle = () => {
    onSortChange(sortOrder === 'asc' ? 'desc' : 'asc');
  };

  return (
    <div className="max-w-4xl mx-auto mb-8 space-y-4">
      {/* Search Input */}
      <div className="space-y-2">
        <div className="relative">
          {isSemanticSearching ? (
            <Loader2 className="absolute left-3 top-1/2 transform -translate-y-1/2 text-primary w-4 h-4 animate-spin" />
          ) : (
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground w-4 h-4" />
          )}
          <Input
            type="text"
            placeholder={placeholder}
            value={searchTerm}
            onChange={(e) => onSearchChange(e.target.value)}
            className="pl-10 pr-10"
          />
          {searchTerm && (
            <button
              onClick={handleClear}
              className="absolute right-3 top-1/2 transform -translate-y-1/2 text-muted-foreground hover:text-foreground transition-colors"
              aria-label="Clear search"
            >
              <X className="w-4 h-4" />
            </button>
          )}
        </div>
        
        {/* Search Status Indicators */}
        {searchTerm.trim() && (
          <div className="flex items-center gap-2 text-sm">
            {isSemanticSearching && (
              <span className="text-primary flex items-center gap-1">
                <Loader2 className="w-3 h-3 animate-spin" />
                Searching with AI...
              </span>
            )}
            {semanticSearchError && (
              <span className="text-orange-600 flex items-center gap-1">
                <AlertCircle className="w-3 h-3" />
                {semanticSearchError}
              </span>
            )}
            {!isSemanticSearching && !semanticSearchError && searchTerm.trim() && (
              <span className="text-green-600 text-xs">
                🧠 AI-powered semantic search
              </span>
            )}
          </div>
        )}
      </div>

      {/* Controls Row */}
      <div className="flex flex-wrap items-center justify-center gap-2">
        {/* Sort Button */}
        <Button
          variant="outline"
          size="sm"
          onClick={handleSortToggle}
          className="flex items-center gap-2"
        >
          {sortOrder === 'asc' ? (
            <ArrowUp className="w-4 h-4" />
          ) : (
            <ArrowDown className="w-4 h-4" />
          )}
          Date {sortOrder === 'asc' ? 'Oldest' : 'Newest'}
        </Button>

        {/* Tag Filter Toggle */}
        <Button
          variant="outline"
          size="sm"
          onClick={() => setShowTagFilter(!showTagFilter)}
          className="flex items-center gap-2"
        >
          <Filter className="w-4 h-4" />
          Tags {selectedTags.length > 0 && `(${selectedTags.length})`}
        </Button>

        {/* Clear Filters */}
        {(selectedTags.length > 0) && (
          <Button
            variant="ghost"
            size="sm"
            onClick={() => {
              onSearchChange('');
              onClearAllTags();
            }}
            className="text-muted-foreground hover:text-foreground cursor-pointer"
          >
            Clear all
          </Button>
        )}
      </div>

      {/* Tag Filter Panel */}
      {showTagFilter && (
        <div className="bg-card border rounded-lg p-4">
          <h3 className="text-sm font-medium mb-3">Filter by tags:</h3>
          <div className="flex flex-wrap gap-2">
            {availableTags.map((tag) => {
              const isSelected = selectedTags.includes(tag);
              return (
                <Badge
                  key={tag}
                  variant={isSelected ? "default" : "outline"}
                  className="cursor-pointer hover:bg-primary/80 transition-colors"
                  onClick={() => handleTagClick(tag)}
                >
                  {tag}
                  {isSelected && <X className="w-3 h-3 ml-1" />}
                </Badge>
              );
            })}
          </div>
          {availableTags.length === 0 && (
            <p className="text-sm text-muted-foreground">No tags available</p>
          )}
        </div>
      )}

      {/* Selected Tags Display */}
      {selectedTags.length > 0 && (
        <div className="flex flex-wrap gap-2 justify-center">
          <span className="text-sm text-muted-foreground self-center">Filtered by:</span>
          {selectedTags.map((tag) => (
            <Badge
              key={tag}
              variant="secondary"
              className="cursor-pointer"
              onClick={() => handleTagClick(tag)}
            >
              {tag}
              <X className="w-3 h-3 ml-1" />
            </Badge>
          ))}
        </div>
      )}
    </div>
  );
};

export default MemorySearch;