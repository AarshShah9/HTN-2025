import os
from typing import List, Dict, Any
import google.generativeai as genai
from PIL import Image

def get_image_tags_batch_as_parts(
    image_paths: List[str],
    max_tags: int = 20
) -> Dict[str, Any]:
    """
    Implementation that sends all images at once as a multipart prompt,
    using structured output to force JSON format.
    
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
    
    # Initialize the model with specific settings for JSON output
    generation_config = {
        "temperature": 0.1,  # Low temperature for more deterministic output
        "max_output_tokens": 4096,
        "response_mime_type": "application/json",
    }
    
    model = genai.GenerativeModel(
        model_name='gemini-1.5-flash',
        generation_config=generation_config
    )
    
    # Prepare the images and parts
    parts = []
    valid_images = []
    
    # Define schema for the batch response
    # This represents an array of image analysis objects
    schema = {
        "type": "array",
        "items": {
            "type": "object",
            "properties": {
                "image_index": {
                    "type": "integer",
                    "description": "Index of the image in the provided batch (0-based)"
                },
                "tags": {
                    "type": "array",
                    "description": f"Up to {max_tags} descriptive tags about the image",
                    "items": {"type": "string"}
                },
                "objects": {
                    "type": "array",
                    "description": "Objects detected in the image with their approximate locations",
                    "items": {
                        "type": "object",
                        "properties": {
                            "name": {"type": "string"},
                            "location": {"type": "string"}
                        }
                    }
                },
                "scene_type": {
                    "type": "string",
                    "description": "Type of scene (indoor, outdoor, urban, nature, etc.)"
                },
                "colors": {
                    "type": "array",
                    "description": "Dominant colors in the image",
                    "items": {"type": "string"}
                },
                "description": {
                    "type": "string",
                    "description": "Brief description of the image content"
                }
            },
            "required": ["image_index", "tags", "objects", "scene_type", "colors", "description"]
        }
    }
    
    # Create the text prompt
    text_prompt = f"Analyze these {len(image_paths)} images and provide detailed information about each one."
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
        # Process with Gemini using the schema for structured output
        response = model.generate_content(
            contents=parts,
            response_schema=schema
        )
        
        # Extract data from the structured response
        batch_results = response.candidates[0].content.parts[0].function_call.args
        
        # Map results to original filenames
        results = {
            "batch_results": batch_results,
            "image_paths": valid_images
        }
        return results
            
    except Exception as e:
        return {"error": str(e)}
    