"""AI-powered image tagging and analysis using Google Gemini.

This module provides functionality for:
- Batch image analysis using Google Gemini API
- Automatic tag generation and object detection
- Scene classification and color analysis
- Structured JSON output for consistent data processing
"""

import base64
import json
import os
from typing import Any, Dict, List

# cspell:disable-next-line
from dotenv import load_dotenv

# cspell:disable-next-line
from google import genai
from google.genai import types
from PIL import ImageFile

# Enable loading of truncated images to prevent PIL errors with API processing
ImageFile.LOAD_TRUNCATED_IMAGES = True


def get_image_tags_batch_as_parts(
    image_paths: List[str], max_tags: int = 20
) -> Dict[str, Any]:
    """Analyze multiple images in batch using Google Gemini API.

    This function processes multiple images simultaneously to generate:
    - Descriptive tags for each image
    - Object detection with locations
    - Scene type classification (indoor/outdoor/urban/nature)
    - Dominant color analysis
    - Natural language descriptions

    The function uses prompt engineering to ensure consistent JSON output
    format for reliable data processing.

    Args:
        image_paths: List of relative paths to base64 image files in /images folder
        max_tags: Maximum number of tags to extract per image

    Returns:
        Dict containing:
        - batch_results: List of analysis results for each image
        - image_paths: List of successfully processed image paths
        - error: Error message if processing failed

    Raises:
        ValueError: If GOOGLE_API_KEY environment variable is not set
        Exception: If API call or image processing fails

    Example:
        >>> result = get_image_tags_batch_as_parts(["img1.jpg", "img2.jpg"])
        >>> if "error" not in result:
        ...     for analysis in result["batch_results"]:
        ...         print(f"Tags: {analysis['tags']}")
        ...         print(f"Description: {analysis['description']}")
    """
    load_dotenv()
    # Configure the Gemini API
    api_key = os.environ.get("GOOGLE_API_KEY")
    if not api_key:
        raise ValueError(
            "API key must be provided or set as GOOGLE_API_KEY environment variable"
        )
    # cspell:disable-next-line
    client = genai.Client(api_key=api_key)

    # Initialize the config with specific settings for more deterministic output
    config = types.GenerateContentConfig(
        temperature=0.1,  # Low temperature for more deterministic output
        max_output_tokens=4096,
    )

    # Prepare the images and parts
    parts = []
    valid_images = []

    # Create the text prompt that specifies the exact JSON structure we want
    text_prompt = f"""
    Analyze these {len(image_paths)} images and provide detailed information about each one.
    
    Return ONLY a valid JSON array with one object per image, where each object has this exact structure:
    
    {{
      "image_index": <index of image starting from 0>,
      "tags": [<up to {max_tags} descriptive tags as strings>],
      "objects": [
        {{
          "name": "<object name>",
          "location": "<location in image>"
        }}
      ],
      "scene_type": "<type of scene: indoor, outdoor, urban, nature, etc.>",
      "colors": [<dominant colors as strings>],
      "description": "<brief description of image content>"
    }}
    
    Only respond with the raw JSON array, with no markdown formatting, no code blocks, no explanations.
    The response must start with '[' and end with ']' and be valid JSON that can be parsed directly.
    """
    parts.append(types.Part.from_text(text=text_prompt))

    # Add each image as a part by reading base64 files
    for _, img_path in enumerate(image_paths):
        try:
            # Construct full path to the base64 file in images directory
            full_path = os.path.join("images", img_path)

            # Read the base64 content from the file
            with open(full_path, "r") as f:
                base64_content = f.read().strip()

            # Handle data URL format (data:image/jpeg;base64,<data>)
            if base64_content.startswith("data:"):
                # Extract mime type and base64 data
                header, base64_data = base64_content.split(",", 1)
                mime_type = header.split(":", 1)[1].split(";", 1)[0]
            else:
                # Assume it's raw base64 data and default mime type
                base64_data = base64_content
                mime_type = "image/jpeg"

            # Decode base64 to bytes
            image_bytes = base64.b64decode(base64_data)

            parts.append(types.Part.from_bytes(data=image_bytes, mime_type=mime_type))
            valid_images.append(img_path)
        except Exception as e:
            print(f"Error loading image {img_path}: {e}")

    if len(parts) <= 1:  # Only the text prompt, no valid images
        return {"error": "No valid images provided"}

    try:
        # Process with Gemini
        response = client.models.generate_content(
            model="gemini-1.5-flash", contents=parts, config=config
        )

        # Extract JSON from the response text
        try:
            response_text = response.text
            if not response_text:
                return {"error": "Empty response from API"}
            # Remove any markdown code block indicators if present
            response_text = (
                response_text.replace("```json", "").replace("```", "").strip()
            )
            batch_results = json.loads(response_text)

            # Map results to original filenames
            results = {"batch_results": batch_results, "image_paths": valid_images}
            return results

        except json.JSONDecodeError as e:
            return {
                "error": f"Failed to parse JSON response: {str(e)}",
                "raw_response": response.text,
            }

    except Exception as e:
        return {"error": str(e)}
