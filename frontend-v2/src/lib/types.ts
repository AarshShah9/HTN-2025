export type MemoryImage = {
  id: string;
  title: string;
  description: string;
  date: string;
  tags: string[];
  imageUrl: string;
  location?: string;
  latitude?: number;
  longitude?: number;
  people?: string[];
};

export type MemoryAppData = {
  images: MemoryImage[];
};