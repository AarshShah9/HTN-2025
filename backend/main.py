import asyncio
from contextlib import asynccontextmanager
import os
from typing import List

from app.routers.image_db import router as image_db_router
from database.database import init_db
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Initialize database
    await init_db()
    print("Database initialized")
    
    # Background tasks storage
    background_tasks: List[asyncio.Task] = []

    # Start the background worker
    async def print_worker():
        """Worker that prints a message every 15 seconds."""
        while True:
            print("Worker running - 15 second interval")
            await asyncio.sleep(15)

    # Create and start the worker task
    task = asyncio.create_task(print_worker())
    background_tasks.append(task)
    print("Background worker started")

    yield  # FastAPI operates while the context is active

    # Cleanup when the app shuts down
    for task in background_tasks:
        task.cancel()
    print("Background worker stopped")


app = FastAPI(title="HTN 2025", version="1.0.0", lifespan=lifespan)

# Add CORS middleware to allow frontend connections
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Frontend URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Create images directory if it doesn't exist
os.makedirs("images", exist_ok=True)

# Mount static files for images
app.mount("/images", StaticFiles(directory="images"), name="images")

# Include routers
app.include_router(image_db_router)


@app.get("/")
def read_root():
    return {"message": "HTN 2025"}

# start
if __name__ == "__main__":
    import uvicorn
    
    uvicorn.run(app, host="0.0.0.0", port=8000)