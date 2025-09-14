// UserRouter.ts
import { Router } from "express";
import {
  getVideos,
  getVideosByTranscription,
} from "../controllers/video.controller";

const router = Router();

router.get("/", getVideos);
router.get("/by-transcription", getVideosByTranscription);

export default router;