import { Input } from '@/components/ui/input';
import { Search, X } from 'lucide-react';
import React from 'react';

type MemorySearchProps = {
  searchTerm: string;
  onSearchChange: (term: string) => void;
  placeholder?: string;
};

const MemorySearch: React.FC<MemorySearchProps> = ({
  searchTerm,
  onSearchChange,
  placeholder = "Search memories..."
}) => {
  const handleClear = () => {
    onSearchChange('');
  };

  return (
    <div className="max-w-md mx-auto mb-8">
      <div className="relative">
        <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-muted-foreground w-4 h-4" />
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
    </div>
  );
};

export default MemorySearch;