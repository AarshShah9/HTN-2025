// UserRouter.ts
import { Router } from "express";
import {
  getImages,
  getImagesByDescription,
  getImagesByTranscription,
  uploadImageAndAudio,
} from "../controllers/image.controller";

const router = Router();

router.get("/", getImages);
router.post("", uploadImageAndAudio);
router.get("/by-description", getImagesByDescription);
router.get("/by-transcription", getImagesByTranscription);

export default router;
