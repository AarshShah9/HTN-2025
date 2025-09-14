import { useEffect, useMemo, useState } from 'react';
import type { MemoryImage } from '../lib/types';
import { searchMemoriesByTranscript } from '../utils/searchMemories';

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
  isSemanticSearching: boolean;
  semanticSearchError: string | null;
};

export const useMemorySearch = (memories: MemoryImage[]): UseMemorySearchResult => {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedTags, setSelectedTags] = useState<string[]>([]);
  const [sortOrder, setSortOrder] = useState<SortOrder>('desc');
  const [semanticResults, setSemanticResults] = useState<MemoryImage[]>([]);
  const [isSemanticSearching, setIsSemanticSearching] = useState(false);
  const [semanticSearchError, setSemanticSearchError] = useState<string | null>(null);

  // Debounced semantic search effect
  useEffect(() => {
    const performSemanticSearch = async (term: string) => {
      if (!term.trim()) {
        setSemanticResults([]);
        setSemanticSearchError(null);
        return;
      }

      setIsSemanticSearching(true);
      setSemanticSearchError(null);

      try {
        const results = await searchMemoriesByTranscript(term, 50);
        setSemanticResults(results);
      } catch (error) {
        console.error('Semantic search failed:', error);
        setSemanticSearchError('Search failed. Using local results instead.');
        setSemanticResults([]);
      } finally {
        setIsSemanticSearching(false);
      }
    };

    // Debounce the search to avoid too many API calls
    const timeoutId = setTimeout(() => {
      performSemanticSearch(searchTerm);
    }, 1000); // 1000ms delay

    return () => clearTimeout(timeoutId);
  }, [searchTerm]);

  // Reset semantic search when search term is cleared
  useEffect(() => {
    if (!searchTerm.trim()) {
      setSemanticResults([]);
      setSemanticSearchError(null);
    }
  }, [searchTerm]);

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
    // Determine which dataset to use as the base
    let baseMemories: MemoryImage[];
    
    if (searchTerm.trim() && semanticResults.length > 0) {
      // Use semantic search results when available
      baseMemories = semanticResults;
    } else if (searchTerm.trim()) {
      // Fallback to client-side text search if semantic search failed or returned no results
      const term = searchTerm.toLowerCase();
      baseMemories = memories.filter((memory) =>
        memory.description?.toLowerCase().includes(term) ||
        memory.tags.some(tag => tag.toLowerCase().includes(term)) ||
        (memory.location && memory.location.toLowerCase().includes(term))
      );
    } else {
      // No search term - use all memories
      baseMemories = memories;
    }

    // Apply tag filtering to the base dataset
    let filtered = baseMemories;
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
  }, [memories, searchTerm, selectedTags, sortOrder, semanticResults]);

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
    isSemanticSearching,
    semanticSearchError,
  };
};