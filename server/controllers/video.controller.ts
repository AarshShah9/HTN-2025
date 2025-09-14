import { Request, Response, NextFunction } from "express";
import prisma from "../prisma/client";
import { cosineSimilarity, embedText } from "../util/aiHelpers";
import fs from "fs";
import path from "path";
import { v4 as uuidv4 } from "uuid";
import { transcribeAudioWithGemini } from "../util/aiHelpers";
import { VideoAndAudio } from "../types";

export const getVideos = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const videos = await prisma.video.findMany();
    res.status(200).json(videos);
  } catch (error) {
    res.status(500).json({ message: "Error fetching videos" });
  }
};

export const getVideosByTranscription = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const { query } = req.query;

  try {
    const embeddedQuery = await embedText(query as string);
    const allVideos = await prisma.video.findMany({
      include: {
        audio: true,
      },
    });
    // for each video do a similarity search on the audio embeddings
    const videosWithSimilarity = allVideos.map((video) => {
      const similarity = cosineSimilarity(
        embeddedQuery as unknown as number[],
        video.audio?.embeddings ?? [],
      );
      return {
        ...video,
        similarity,
      };
    });

    // Sort by similarity in descending order and get the video with highest similarity
    const sortedVideos = videosWithSimilarity.sort(
      (a, b) => b.similarity - a.similarity,
    );
    const bestMatch = sortedVideos.length > 0 ? sortedVideos[0] : null;

    res.status(200).json(bestMatch);
  } catch (error) {
    res.status(500).json({ message: "Error fetching videos" });
  }
};

export const uploadVideoAndAudio = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const { frames, audio, latitude, longitude } = VideoAndAudio.parse(
      req.body,
    );

    // upload audio (base64 string) to server/audio folder on disk
    const audioDir = path.join(__dirname, "..", "audio");
    if (!fs.existsSync(audioDir)) {
      fs.mkdirSync(audioDir, { recursive: true });
    }
    const audioPath = path.join(audioDir, `${uuidv4()}.wav`);
    const base64Data = audio.replace(/^data:audio\/wav;base64,/, "");
    // Decode the Base64 string into a binary data buffer.
    const audioBuffer = Buffer.from(base64Data, "base64");
    // Write the buffer to a file.
    fs.writeFileSync(audioPath, audioBuffer);
    const transcription = await transcribeAudioWithGemini(audioPath);
    if (!transcription) {
      throw new Error("Failed to transcribe audio");
    }
    const embbeddedTranscription = await embedText(transcription);
    if (
      !embbeddedTranscription ||
      embbeddedTranscription.some((embedding) => embedding.values === undefined)
    ) {
      throw new Error("Failed to embed transcription");
    }

    const audioRecord = await prisma.audio.create({
      data: {
        transcription,
        embeddings: embbeddedTranscription
          .map((embedding) => embedding.values)
          .flat()
          .filter((val): val is number => val !== undefined),
      },
    });

    const videoDir = path.join(__dirname, "..", "videos");
    if (!fs.existsSync(videoDir)) {
      fs.mkdirSync(videoDir, { recursive: true });
    }

    const videoRecords = frames.map((frame) => {
      const videoPath = path.join(videoDir, `${uuidv4()}.b64`);
      fs.writeFileSync(videoPath, frame);
      return videoPath;
    });

    const videoRecord = await prisma.video.create({
      data: {
        frames: videoRecords,
        audio_id: audioRecord.id,
        latitude,
        longitude,
      },
    });

    res.status(200).json(videoRecord);
  } catch (error) {
    res.status(500).json({ message: "Error uploading video" });
  }
};
