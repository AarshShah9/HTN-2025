import { Request, Response, NextFunction } from "express";
import prisma from "../prisma/client";

export const getImages = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const images = await prisma.image.findMany();
        res.status(200).json(images);
    } catch (error) {
        res.status(500).json({ message: "Error fetching images" });
    }
}

export const getImagesByDescription = async (req: Request, res: Response, next: NextFunction) => {
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
}

export const getImagesByTranscription = async (req: Request, res: Response, next: NextFunction) => {
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
}