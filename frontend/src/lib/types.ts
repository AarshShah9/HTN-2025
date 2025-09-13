export type MemoryImage = {
  id: string;
  date: string;
  tags: string[];
  imageUrl: string;
  transcript: string;
  location?: string;
  latitude?: number;
  longitude?: number;
};

export type MemoryAppData = {
  images: MemoryImage[];
};