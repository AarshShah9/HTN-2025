import { Request, Response, NextFunction } from "express";
import prisma from "../prisma/client";

export const getVideos = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const videos = await prisma.video.findMany();
        res.status(200).json(videos);
    } catch (error) {
        res.status(500).json({ message: "Error fetching videos" });
    }
}

export const getVideosByTranscription = async (req: Request, res: Response, next: NextFunction) => {
    const { transcription } = req.query;
    try {
        const videos = await prisma.video.findMany({
            where: {
                audio: {
                    transcription: {
                        contains: transcription as string,
                    },
                },
            },
        });
        res.status(200).json(videos);
    } catch (error) {
        res.status(500).json({ message: "Error fetching videos" });
    }
}

