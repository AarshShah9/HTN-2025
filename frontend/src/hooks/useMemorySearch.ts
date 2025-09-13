import { useMemo, useState } from 'react';
import type { MemoryImage } from '../lib/types';

export type SortOrder = 'asc' | 'desc';
export type UseMemorySearchResult = {
  searchTerm: string;
  setSearchTerm: (term: string) => void;
  selectedTags: string[];
  setSelectedTags: (tags: string[]) => void;
  sortOrder: SortOrder;
  setSortOrder: (order: SortOrder) => void;
  filteredMemories: MemoryImage[];
  totalCount: number;
  filteredCount: number;
  totalTags: number;
  totalLocations: number;
  availableTags: string[];
};

export const useMemorySearch = (memories: MemoryImage[]): UseMemorySearchResult => {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedTags, setSelectedTags] = useState<string[]>([]);
  const [sortOrder, setSortOrder] = useState<SortOrder>('desc');

  // Calculate stats
  const totalTags = useMemo(() => {
    const tagSet = new Set<string>();
    memories.forEach(memory => {
      memory.tags.forEach(tag => tagSet.add(tag));
    });
    return tagSet.size;
  }, [memories]);

  const totalLocations = useMemo(() => {
    const locationSet = new Set<string>();
    memories.forEach(memory => {
      if (memory.location) {
        locationSet.add(memory.location);
      }
    });
    return locationSet.size;
  }, [memories]);

  const availableTags = useMemo(() => {
    const tagSet = new Set<string>();
    memories.forEach(memory => {
      memory.tags.forEach(tag => tagSet.add(tag));
    });
    return Array.from(tagSet).sort();
  }, [memories]);

  const filteredMemories = useMemo(() => {
    let filtered = memories;

    // Apply text search
    if (searchTerm.trim()) {
      const term = searchTerm.toLowerCase();
      filtered = filtered.filter((memory) =>
        memory.transcript.toLowerCase().includes(term) ||
        memory.tags.some(tag => tag.toLowerCase().includes(term)) ||
        (memory.location && memory.location.toLowerCase().includes(term)) ||
        (memory.people && memory.people.some(person => person.toLowerCase().includes(term)))
      );
    }

    // Apply tag filtering
    if (selectedTags.length > 0) {
      filtered = filtered.filter((memory) =>
        selectedTags.some(selectedTag =>
          memory.tags.some(memoryTag =>
            memoryTag.toLowerCase().includes(selectedTag.toLowerCase())
          )
        )
      );
    }

    // Apply date sorting
    filtered = [...filtered].sort((a, b) => {
      const dateA = new Date(a.date).getTime();
      const dateB = new Date(b.date).getTime();
      return sortOrder === 'asc' ? dateA - dateB : dateB - dateA;
    });

    return filtered;
  }, [memories, searchTerm, selectedTags, sortOrder]);

  return {
    searchTerm,
    setSearchTerm,
    selectedTags,
    setSelectedTags,
    sortOrder,
    setSortOrder,
    filteredMemories,
    totalCount: memories.length,
    filteredCount: filteredMemories.length,
    totalTags,
    totalLocations,
    availableTags,
  };
};