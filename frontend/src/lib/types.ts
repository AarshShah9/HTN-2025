export type MemoryImage = {
  id: string;
  date: string;
  tags: string[];
  imageUrl: string;
  description?: string;
  location?: string;
  latitude?: number;
  longitude?: number;
};

export type MemoryAppData = {
  images: MemoryImage[];
};