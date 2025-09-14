// UserRouter.ts
import { Router } from "express";
import { getImages, getImagesByDescription, getImagesByTranscription } from "../controllers/image.controller";


const router = Router();

router.get("/", getImages);
router.get("/by-description", getImagesByDescription);
router.get("/by-transcription", getImagesByTranscription);

export default router;