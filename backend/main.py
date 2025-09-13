from app.routers.image import router as image_router
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import asyncio
from typing import List
from contextlib import asynccontextmanager

@asynccontextmanager
async def lifespan(app: FastAPI):
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

# Include routers
app.include_router(image_router)


@app.get("/")
def read_root():
    return {"message": "HTN 2025"}