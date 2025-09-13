import base64
from pathlib import Path
from typing import Optional


def image_to_base64(image_path: str) -> Optional[str]:
    """
    Convert a PNG image file to a base64 encoded string.
    
    Args:
        image_path (str): Path to the PNG image file
        
    Returns:
        Optional[str]: Base64 encoded string of the image, or None if conversion fails
        
    Raises:
        FileNotFoundError: If the image file doesn't exist
        Exception: For other conversion errors
    """
    try:
        # Check if file exists
        if not Path(image_path).exists():
            raise FileNotFoundError(f"Image file not found: {image_path}")
        
        # Read the image file in binary mode
        with open(image_path, "rb") as image_file:
            # Encode the binary data to base64
            base64_encoded = base64.b64encode(image_file.read())
            # Convert bytes to string
            base64_string = base64_encoded.decode('utf-8')
            
        return base64_string
        
    except FileNotFoundError:
        raise
    except Exception as e:
        print(f"Error converting image to base64: {str(e)}")
        return None
    
if __name__ == "__main__":
    # /home/andrewheschl/Documents/HTN-2025/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.webp
    print(image_to_base64("/home/andrewheschl/Documents/HTN-2025/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.webp"))