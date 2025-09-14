// UserRouter.ts
import { Router } from "express";
import {
  getVideos,
  getVideosByTranscription,
  uploadVideoAndAudio,
} from "../controllers/video.controller";

const router = Router();

router.get("/", getVideos);
router.post("/upload", uploadVideoAndAudio);
router.get("/by-transcription", getVideosByTranscription);

export default router;
