import { GoogleGenAI } from "@google/genai";
import fs from "fs";

export const ai = new GoogleGenAI({
  apiKey: process.env.GOOGLE_API_KEY,
});

export async function embedText(text: string) {
  const response = await ai.models.embedContent({
    model: "gemini-embedding-001",
    contents: text,
  });

  return response.embeddings;
}

export const cosineSimilarity = (
  embedding1: number[],
  embedding2: number[],
) => {
  // Check if embeddings have the same length
  if (embedding1.length !== embedding2.length) {
    throw new Error("Embeddings must have the same length");
  }

  // Calculate dot product
  let dotProduct = 0;
  for (let i = 0; i < embedding1.length; i++) {
    dotProduct += embedding1[i] * embedding2[i];
  }

  // Calculate magnitudes
  let magnitude1 = 0;
  let magnitude2 = 0;
  for (let i = 0; i < embedding1.length; i++) {
    magnitude1 += embedding1[i] * embedding1[i];
    magnitude2 += embedding2[i] * embedding2[i];
  }

  magnitude1 = Math.sqrt(magnitude1);
  magnitude2 = Math.sqrt(magnitude2);

  // Avoid division by zero
  if (magnitude1 === 0 || magnitude2 === 0) {
    return 0;
  }

  // Calculate cosine similarity
  return dotProduct / (magnitude1 * magnitude2);
};

export async function transcribeAudioWithGemini(
  audioFilePath: string,
): Promise<string | null> {
  try {
    if (!fs.existsSync(audioFilePath)) {
      throw new Error(`Audio file not found: ${audioFilePath}`);
    }
    // Upload file to Gemini
    const file = await ai.files.upload({ file: audioFilePath });
    const prompt = `
      Please transcribe this audio file to text.
      Provide only the transcribed text without any additional commentary or formatting.
      If the audio is unclear or inaudible, indicate that in the transcription.
    `;
    const response = await ai.models.generateContent({
      model: "gemini-1.5-flash",
      contents: [
        {
          parts: [
            { text: prompt },
            { fileData: { mimeType: "audio/wav", fileUri: file.uri } }
          ]
        }
      ],
    });
    // Clean up uploaded file
    if (file.name) {
      await ai.files.delete({ name: file.name });
    }
    return response.text?.trim() ?? null;
  } catch (err: any) {
    console.error("Error transcribing audio:", JSON.stringify(err, null, 2));
    return null;
  }
}
