import os
import tempfile
from pathlib import Path
from typing import Optional
import dotenv
import sounddevice as sd

import google.generativeai as genai


"""
USE transcribe() FUNCTION< AND PASS IN THE PATH TO THE AUDIO FILE
"""

def configure_gemini():
    """Configure Google Gemini API with API key from environment variables."""
    dotenv.load_dotenv()
    api_key = os.getenv("GOOGLE_API_KEY")
    if not api_key:
        raise ValueError("GOOGLE_API_KEY environment variable is required")
    genai.configure(api_key=api_key)

configure_gemini()

def transcribe_audio_with_gemini(audio_file_path: str) -> Optional[str]:
    """
    Transcribe an audio file to text using Google Gemini.
    
    Args:
        audio_file_path (str): Path to the audio file to transcribe
        
    Returns:
        Optional[str]: Transcribed text or None if transcription fails
        
    Raises:
        FileNotFoundError: If the audio file doesn't exist
        ValueError: If API key is not configured
        Exception: For other transcription errors
    """
    try:
        # Configure Gemini API
        configure_gemini()
        
        # Check if file exists
        if not Path(audio_file_path).exists():
            raise FileNotFoundError(f"Audio file not found: {audio_file_path}")
        
        # Upload the audio file to Gemini
        audio_file = genai.upload_file(audio_file_path)
        
        # Wait for the file to be processed
        import time
        while audio_file.state.name == "PROCESSING":
            time.sleep(1)
            audio_file = genai.get_file(audio_file.name)
        
        if audio_file.state.name == "FAILED":
            raise Exception("Audio file processing failed")
        
        # Use Gemini to transcribe the audio
        model = genai.GenerativeModel("gemini-1.5-flash")
        
        prompt = """
        Please transcribe this audio file to text. 
        Provide only the transcribed text without any additional commentary or formatting.
        If the audio is unclear or inaudible, indicate that in the transcription.
        """
        
        response = model.generate_content([prompt, audio_file])
        
        # Clean up the uploaded file
        genai.delete_file(audio_file.name)
        
        return response.text.strip() if response.text else None
        
    except FileNotFoundError:
        raise
    except ValueError:
        raise
    except Exception as e:
        print(f"Error transcribing audio: {str(e)}")
        return None


def save_audio_from_base64(audio_b64: str, sample_rate: int = 44100, filename: str = "audio.wav"):
    audio_bytes = base64.b64decode(audio_b64)
    audio_np = np.frombuffer(audio_bytes, dtype=np.int16)
    with wave.open(filename, 'wb') as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(sample_rate)
        wf.writeframes(audio_np.tobytes())
# Save frames
    for idx, f_b64 in enumerate(frames):
        frame_path = os.path.join(folder_path, f"frame_{idx:05d}.jpg")
        with open(frame_path, "wb") as f:
            f.write(base64.b64decode(f_b64))







def transcribe_audio_from_bytes(audio_bytes: bytes, filename: str = "audio.wav") -> Optional[str]:
    """
    Transcribe audio from bytes using Google Gemini.
    
    Args:
        audio_bytes (bytes): Audio data as bytes
        filename (str): Filename for the temporary file (with extension)
        
    Returns:
        Optional[str]: Transcribed text or None if transcription fails
    """
    try:
        # Create a temporary file
        save_audio_from_base64(audio_bytes, filename=filename)
        
        try:
            # Transcribe the temporary file
            result = transcribe_audio_with_gemini(filename)
            return result
        finally:
            # Clean up the temporary file
            Path(filename).unlink(missing_ok=True)
            
    except Exception as e:
        print(f"Error transcribing audio from bytes: {str(e)}")
        return None
    


def record_wav(filename: str = "audio.wav"):
    """
    Record 3 second audio from the microphone and save it to a file.
    
    Args:
        filename (str): Filename for the audio file
        
    Returns:
        str: Path to the recorded audio file, or None if recording failed
    """
    try:
        import numpy as np
        import wave
        
        # Record audio parameters
        duration = 3  # seconds
        samplerate = 44100
        channels = 1
        
        print(f"Recording {duration} seconds of audio...")
        
        # Record the audio
        frames = int(duration * samplerate)
        audio = sd.rec(frames=frames, samplerate=samplerate, channels=channels, dtype='int16')
        sd.wait()  # Wait for recording to complete
        
        print("Recording complete. Saving to file...")
        
        # Save as WAV file
        with wave.open(filename, 'wb') as wf:
            wf.setnchannels(channels)
            wf.setsampwidth(2)  # 2 bytes for int16
            wf.setframerate(samplerate)
            wf.writeframes(audio.tobytes())
        
        print(f"Audio saved to {filename}")
        return filename
        
    except Exception as e:
        print(f"Error recording audio: {str(e)}")
        return None


def transcribe(audio_file_path: str) -> Optional[str]:
    try:
        return transcribe_audio_with_gemini(audio_file_path)
    except Exception as e:
        print(f"Error transcribing audio: {str(e)}")
        return None
    
if __name__ == "__main__":
    configure_gemini()
    audio_file = record_wav("audio.wav")
    if audio_file:
        result = transcribe_audio_with_gemini(audio_file)
        if result:
            print(f"Transcription: {result}")
        else:
            print("Transcription failed")
    else:
        print("Recording failed")