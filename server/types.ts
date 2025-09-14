import z from "zod";

export const ImageAndAudio = z.object({
  frames: z.array(z.string()),
  audio: z.string().nonempty(),
  latitude: z.number().optional(),
  longitude: z.number().optional(),
});

export const VideoAndAudio = z.object({
  frames: z.array(z.string()),
  audio: z.string().nonempty(),
  latitude: z.number().optional(),
  longitude: z.number().optional(),
});
