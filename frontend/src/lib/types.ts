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

export type MemoryVideo = {
  id: string;
  date: string;
  tags: string[];
  frames: string[]; // Array of base64 frame strings
  description?: string;
  location?: string;
  latitude?: number;
  longitude?: number;
  fps: number;
  duration: number;
  audio_id?: string;
  transcription?: string;
};

export type MemoryAppData = {
  images: MemoryImage[];
};

export type SnapshotItem = MemoryImage | MemoryVideo;

export const isVideo = (item: SnapshotItem): item is MemoryVideo => {
  return 'frames' in item;
};