import fs from "fs";
import path from "path";
import { Part } from "@google/genai";
import { ai } from "./aiHelpers";

export interface ImageAnalysis {
  image_index: number;
  tags: string[];
  description: string;
}

export interface BatchResult {
  batch_results?: ImageAnalysis[];
  image_paths?: string[];
  error?: string;
  raw_response?: string;
}

export async function getImageTagsBatchAsParts(
  imagePaths: string[],
  maxTags = 20,
): Promise<BatchResult> {
  // Prompt for just tags + description
  const textPrompt = `
Analyze these ${imagePaths.length} images and return a JSON array with one object per image.

Each object must have exactly this structure:

{
  "image_index": <index starting from 0>,
  "tags": [<up to ${maxTags} descriptive tags as strings>],
  "description": "<brief description of image content>"
}

Respond ONLY with the JSON array (no markdown, no code blocks, no extra text).
  `;

  const parts: Part[] = [{ text: textPrompt }];
  const validImages: string[] = [];

  for (const imgPath of imagePaths) {
    try {
      const fullPath = path.join("images", imgPath);
      const base64Content = fs.readFileSync(fullPath, "utf-8").trim();

      let mimeType = "image/jpeg";
      let base64Data = base64Content;

      if (base64Content.startsWith("data:")) {
        const [header, data] = base64Content.split(",", 2);
        mimeType = header.split(":")[1].split(";")[0];
        base64Data = data;
      }

      const buffer = Buffer.from(base64Data, "base64");

      parts.push({
        inlineData: {
          data: buffer.toString("base64"),
          mimeType,
        },
      });

      validImages.push(imgPath);
    } catch (err) {
      console.error(`Error loading image ${imgPath}:`, err);
    }
  }

  if (parts.length <= 1) {
    return { error: "No valid images provided" };
  }

  try {
    const response = await ai.models.generateContent({
      model: "gemini-1.5-flash",
      contents: [{ role: "user", parts }],
      config: {
        temperature: 0.1,
        maxOutputTokens: 2048,
      },
    });

    const responseText = response.text;
    if (!responseText) {
      return { error: "Empty response from API" };
    }

    const cleanedText = responseText.replace(/```json|```/g, "").trim();

    try {
      const batchResults: ImageAnalysis[] = JSON.parse(cleanedText);
      return { batch_results: batchResults, image_paths: validImages };
    } catch (err) {
      return {
        error: `Failed to parse JSON response: ${String(err)}`,
        raw_response: responseText,
      };
    }
  } catch (err) {
    return { error: String(err) };
  }
}
