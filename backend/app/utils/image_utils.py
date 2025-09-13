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


def base64_to_image(base64_string: str, output_path: str) -> bool:
    """
    Convert a base64 encoded string back to an image file.
    
    Args:
        base64_string (str): Base64 encoded string of the image
        output_path (str): Path where the image file should be saved
        
    Returns:
        bool: True if conversion successful, False otherwise
        
    Raises:
        Exception: For conversion errors
    """
    try:
        # Handle data URI format (e.g., "data:image/png;base64,...")
        if base64_string.startswith("data:image/"):
            # Split the data URI to get just the base64 part
            header, data = base64_string.split(",", 1)
            base64_data = data
        else:
            # Assume it's just the base64 string
            base64_data = base64_string
        
        # Decode the base64 string to binary data
        image_data = base64.b64decode(base64_data)
        
        # Create directory if it doesn't exist
        output_dir = Path(output_path).parent
        output_dir.mkdir(parents=True, exist_ok=True)
        
        # Write the binary data to file
        with open(output_path, "wb") as image_file:
            image_file.write(image_data)
            
        return True
        
    except Exception as e:
        print(f"Error converting base64 to image: {str(e)}")
        return False


if __name__ == "__main__":
    # Test both functions
    image_path = "/home/andrewheschl/Documents/HTN-2025/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.webp"
    
    # Convert image to base64
    base64_str = image_to_base64(image_path)
    if base64_str:
        print(f"Base64 conversion successful. Length: {len(base64_str)} characters")
        print(f"First 50 chars: {base64_str[:50]}...")
        
        # Convert back to image
        output_path = "/tmp/test_output.webp"
        success = base64_to_image(base64_str, output_path)
        if success:
            print(f"Successfully converted back to image: {output_path}")
        else:
            print("Failed to convert back to image")
    else:
        print("Failed to convert image to base64")