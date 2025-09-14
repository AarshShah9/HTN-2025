import os
import wave
from pathlib import Path
from typing import Optional

import dotenv
import numpy as np
import sounddevice as sd
from google import genai

"""
USE transcribe() FUNCTION< AND PASS IN THE PATH TO THE AUDIO FILE
"""


def configure_gemini():
    """Configure Google Gemini API with API key from environment variables."""
    dotenv.load_dotenv()
    api_key = os.getenv("GOOGLE_API_KEY")
    if not api_key:
        raise ValueError("GOOGLE_API_KEY environment variable is required")
    return genai.Client(api_key=api_key)


client = configure_gemini()


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
        # Check if file exists
        if not Path(audio_file_path).exists():
            raise FileNotFoundError(f"Audio file not found: {audio_file_path}")

        # Upload the audio file to Gemini
        audio_file = client.files.upload(file=audio_file_path)

        # Use Gemini to transcribe the audio
        prompt = """
        Please transcribe this audio file to text. 
        Provide only the transcribed text without any additional commentary or formatting.
        If the audio is unclear or inaudible, indicate that in the transcription.
        """

        response = client.models.generate_content(
            model="gemini-1.5-flash", contents=[prompt, audio_file]
        )

        # Clean up the uploaded file
        if audio_file.name:
            client.files.delete(name=audio_file.name)

        return response.text.strip() if response.text else None

    except FileNotFoundError:
        raise
    except ValueError:
        raise
    except Exception as e:
        print(f"Error transcribing audio: {str(e)}")
        return None


def save_audio_from_bytes(
    audio_bytes: bytes, sample_rate: int = 44100, filename: str = "audio.wav"
):
    audio_np = np.frombuffer(audio_bytes, dtype=np.int16)
    with wave.open(filename, "wb") as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(sample_rate)
        wf.writeframes(audio_np.tobytes())


def transcribe_audio_from_bytes(
    audio_bytes: bytes, filename: str = "audio.wav"
) -> Optional[str]:
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
        save_audio_from_bytes(audio_bytes, filename=filename)

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
        import wave

        # Record audio parameters
        duration = 3  # seconds
        samplerate = 44100
        channels = 1

        print(f"Recording {duration} seconds of audio...")

        # Record the audio
        frames = int(duration * samplerate)
        audio = sd.rec(
            frames=frames, samplerate=samplerate, channels=channels, dtype="int16"
        )
        sd.wait()  # Wait for recording to complete

        print("Recording complete. Saving to file...")

        # Save as WAV file
        with wave.open(filename, "wb") as wf:
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
