import { useMemo, useState } from 'react';
import type { MemoryImage } from '../lib/types';

export type UseMemorySearchResult = {
  searchTerm: string;
  setSearchTerm: (term: string) => void;
  filteredMemories: MemoryImage[];
  totalCount: number;
  filteredCount: number;
};

export const useMemorySearch = (memories: MemoryImage[]): UseMemorySearchResult => {
  const [searchTerm, setSearchTerm] = useState('');

  const filteredMemories = useMemo(() => {
    if (!searchTerm.trim()) {
      return memories;
    }

    const term = searchTerm.toLowerCase();
    return memories.filter((memory) =>
      memory.title.toLowerCase().includes(term) ||
      memory.description.toLowerCase().includes(term) ||
      memory.tags.some(tag => tag.toLowerCase().includes(term)) ||
      (memory.location && memory.location.toLowerCase().includes(term)) ||
      (memory.people && memory.people.some(person => person.toLowerCase().includes(term)))
    );
  }, [memories, searchTerm]);

  return {
    searchTerm,
    setSearchTerm,
    filteredMemories,
    totalCount: memories.length,
    filteredCount: filteredMemories.length,
  };
};