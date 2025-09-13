import os
import json
from typing import List, Dict, Any
import google.generativeai as genai
from PIL import Image

def get_image_tags_batch_as_parts(
    image_paths: List[str],
    max_tags: int = 20
) -> Dict[str, Any]:
    """
    Implementation that sends all images at once as a multipart prompt,
    forcing JSON format output through prompt engineering.
    
    Args:
        image_paths: List of paths to image files
        max_tags: Maximum number of tags to extract per image
    
    Returns:
        Dictionary with results for batch analysis
    """
    # Configure the Gemini API
    api_key = os.environ.get("GOOGLE_API_KEY")
    if not api_key:
        raise ValueError("API key must be provided or set as GOOGLE_API_KEY environment variable")
    genai.configure(api_key=api_key)
    
    # Initialize the model with specific settings for more deterministic output
    generation_config = {
        "temperature": 0.1,  # Low temperature for more deterministic output
        "max_output_tokens": 4096
    }
    
    model = genai.GenerativeModel(
        model_name='gemini-1.5-flash',
        generation_config=generation_config
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
    parts.append(text_prompt)
    
    # Add each image as a part
    for _, img_path in enumerate(image_paths):
        try:
            img = Image.open(img_path)
            parts.append(img)
            valid_images.append(img_path)
        except Exception as e:
            print(f"Error loading image {img_path}: {e}")
    
    if len(parts) <= 1:  # Only the text prompt, no valid images
        return {"error": "No valid images provided"}
    
    try:
        # Process with Gemini
        response = model.generate_content(contents=parts)
        
        # Extract JSON from the response text
        try:
            response_text = response.text
            # Remove any markdown code block indicators if present
            response_text = response_text.replace("```json", "").replace("```", "").strip()
            batch_results = json.loads(response_text)
            
            # Map results to original filenames
            results = {
                "batch_results": batch_results,
                "image_paths": valid_images
            }
            return results
            
        except json.JSONDecodeError as e:
            return {
                "error": f"Failed to parse JSON response: {str(e)}",
                "raw_response": response.text
            }
            
    except Exception as e:
        return {"error": str(e)}
    