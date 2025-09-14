import sys
import asyncio
sys.path.append('../backend')

from database.database import get_db_session
from sqlalchemy import select
from database.models import AudioModel

async def check_audio():
    session = get_db_session()
    result = await session.execute(select(AudioModel))
    audio_records = result.scalars().all()

    print(f'Total audio records: {len(audio_records)}')
    for i, audio in enumerate(audio_records[:10]):  # Show first 10
        has_embedding = audio.embedding is not None
        transcription_preview = audio.transcription[:100] if audio.transcription else "None"
        print(f'Audio {i+1}: ID={audio.id}, transcription=\"{transcription_preview}\", has_embedding={has_embedding}')

    await session.close()

if __name__ == "__main__":
    asyncio.run(check_audio())