import { Request, Response, NextFunction } from "express";
import prisma from "../prisma/client";
import { ImageAndAudio } from "../types";
import fs from "fs";
import path from "path";
import { v4 as uuidv4 } from "uuid";
import { embedText, transcribeAudioWithGemini } from "../util/aiHelpers";

export const getImages = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const images = await prisma.image.findMany();
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ message: "Error fetching images" });
  }
};

export const uploadImageAndAudio = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const { frames, audio, latitude, longitude } = ImageAndAudio.parse(
      req.body,
    );
    console.log("AUDIO", audio);
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

    console.log("writeFileSync", audioPath);
    
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

    const imageDir = path.join(__dirname, "..", "images");
    if (!fs.existsSync(imageDir)) {
      fs.mkdirSync(imageDir, { recursive: true });
    }

    const imageRecords = await prisma.image.createMany({
      data: frames.map((frame) => {
        const imagePath = path.join(imageDir, `${uuidv4()}.b64`);
        fs.writeFileSync(imagePath, frame);
        return {
          path: imagePath,
          audio_id: audioRecord.id,
          latitude,
          longitude,
          tagged: false,
        };
      }),
    });

    res.status(200).json({
      audio: audioRecord,
      images: imageRecords,
    });
  } catch (error) {
    console.error("Error uploading image", error);
    res.status(500).json({ message: "Error uploading image" });
  }
};

export const getImagesByDescription = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const { description } = req.query;
  try {
    const images = await prisma.image.findMany({
      where: {
        description: {
          contains: description as string,
        },
      },
    });
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ message: "Error fetching images" });
  }
};

export const getImagesByTranscription = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  const { transcription } = req.query;
  try {
    const images = await prisma.image.findMany({
      where: {
        audio: {
          transcription: {
            contains: transcription as string,
          },
        },
      },
    });
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ message: "Error fetching images" });
  }
};
