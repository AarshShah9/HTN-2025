"""Main FastAPI application entry point.

This module sets up the FastAPI application with:
- Database initialization
- CORS middleware for frontend communication
- Static file serving for images
- Background worker tasks
- API route registration
"""

import asyncio
from contextlib import asynccontextmanager
import os
from typing import List

from app.routers.image import router as image_router
from app.routers.video import router as video_router
from app.utils.background_worker import fire_image_tagging_worker
from database.database import init_db
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Application lifespan manager.

    Handles startup and shutdown operations:
    - Database initialization on startup
    - Background worker management
    - Cleanup on shutdown
`
    Args:
        app: FastAPI application instance

    Yields:
        None: Control to FastAPI during application runtime
    """
    # Initialize database
    await init_db()
    print("Database initialized")
    
    # Background tasks storage
    background_tasks: List[asyncio.Task] = []

    # Create and start the worker task
    task = asyncio.create_task(fire_image_tagging_worker())
    background_tasks.append(task)
    print("Background worker started")

    yield  # FastAPI operates while the context is active

    # Cleanup when the app shuts down
    for task in background_tasks:
        task.cancel()
    print("Background worker stopped")


# Create FastAPI application instance with metadata
app = FastAPI(
    title="HTN 2025 - AI-Powered Memory Gallery",
    description="A sophisticated image management system with AI-powered tagging and search",
    version="1.0.0",
    lifespan=lifespan
)

# Add CORS middleware to allow frontend connections
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000", "http://localhost:5173"],  # Frontend URLs
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Create images directory if it doesn't exist
os.makedirs("images", exist_ok=True)

# Mount static files for images
app.mount("/images", StaticFiles(directory="images"), name="images")

# Include routers
app.include_router(image_router)
app.include_router(video_router)


@app.get("/")
def read_root():
    """Root endpoint providing basic API information.

    Returns:
        dict: Basic API metadata and status
    """
    return {
        "message": "HTN 2025 - AI-Powered Memory Gallery API",
        "version": "1.0.0",
        "status": "active",
        "docs": "/docs"
    }

# Development server startup
if __name__ == "__main__":
    import uvicorn

    # Run the application with uvicorn for development
    # In production, use a proper ASGI server like gunicorn with uvicorn workers
    uvicorn.run(
        app,
        host="0.0.0.0",
        port=8000,
        reload=True  # Enable auto-reload for development
    )