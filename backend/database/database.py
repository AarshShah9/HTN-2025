"""Database configuration and connection management.

This module provides:
- Async SQLAlchemy engine setup
- Database session management
- Table creation utilities
- Database initialization functions for images and videos
"""

import os
from typing import AsyncGenerator

from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker, create_async_engine
from sqlalchemy.orm import DeclarativeBase

# Database URL - SQLite with async support
DATABASE_URL = "sqlite+aiosqlite:///./database/media.db"

# Create async engine
engine = create_async_engine(
    DATABASE_URL,
    echo=True,  # Set to False in production
    future=True,
)

# Create async session maker
async_session_maker = async_sessionmaker(
    engine,
    class_=AsyncSession,
    expire_on_commit=False,
)


class Base(DeclarativeBase):
    """Base class for all database models.

    This serves as the declarative base for SQLAlchemy models,
    providing common functionality and metadata management.
    """

    pass


async def get_db_session() -> AsyncGenerator[AsyncSession, None]:
    """Dependency function to provide database sessions.

    Creates and manages database sessions for FastAPI dependency injection.
    Ensures proper session cleanup after request completion.

    Yields:
        AsyncSession: Database session for the request. Typed as AsyncGenerator so
        static type checkers (e.g. Pylance) recognize this is a dependency
        generator rather than a coroutine returning an AsyncSession instance.
    """
    async with async_session_maker() as session:
        try:
            yield session
        finally:
            await session.close()


async def create_tables():
    """Create all database tables.

    Uses SQLAlchemy metadata to create all tables defined by models
    that inherit from the Base class.
    """
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)


async def init_db():
    """Initialize the database.

    Performs complete database setup:
    1. Creates the database directory if it doesn't exist
    2. Creates all tables defined in models

    This function is called during application startup.
    """
    # Create database directory if it doesn't exist
    os.makedirs("database", exist_ok=True)
    await create_tables()
