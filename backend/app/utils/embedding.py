from google import genai
from typing import List, Optional


def generate_text_embedding(text: str) -> Optional[List[float]]:
    """Generate text embeddings using Google Gemini.
    
    Args:
        text: The text content to embed
        
    Returns:
        List[float]: The embedding vector, or None if embedding fails
    """
    if not text or not text.strip():
        return None
        
    try:
        client = genai.Client()
        result = client.models.embed_content(
            model="gemini-embedding-001",
            contents=text.strip()
        )
        return result.embeddings
    except Exception as e:
        print(f"Error generating embedding: {str(e)}")
        return None


def calculate_cosine_similarity(embedding1: List[float], embedding2: List[float]) -> float:
    """Calculate cosine similarity between two embedding vectors.
    
    Args:
        embedding1: First embedding vector
        embedding2: Second embedding vector
        
    Returns:
        float: Cosine similarity score between -1 and 1
    """
    if not embedding1 or not embedding2 or len(embedding1) != len(embedding2):
        return 0.0
        
    try:
        import math
        
        # Calculate dot product
        dot_product = sum(a * b for a, b in zip(embedding1, embedding2))
        
        # Calculate magnitudes
        magnitude1 = math.sqrt(sum(a * a for a in embedding1))
        magnitude2 = math.sqrt(sum(b * b for b in embedding2))
        
        # Avoid division by zero
        if magnitude1 == 0.0 or magnitude2 == 0.0:
            return 0.0
            
        return dot_product / (magnitude1 * magnitude2)
    except Exception as e:
        print(f"Error calculating cosine similarity: {str(e)}")
        return 0.0