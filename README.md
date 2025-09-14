# HTN 2025 - AI-Powered Memory Gallery

A sophisticated image management and memory preservation application that combines FastAPI backend with React frontend, featuring AI-powered image analysis, tagging, and search capabilities.

## 🚀 Overview

This application allows users to:
- Upload and manage image collections
- Automatically generate AI-powered tags and descriptions for images
- Search images using natural language queries with AI-powered semantic search
- View image locations on interactive maps
- Transcribe audio recordings for memory context
- Generate embeddings for semantic image search

## 🏗️ Architecture

### Backend (FastAPI)
- **Framework**: FastAPI with async/await support
- **Database**: SQLite with SQLAlchemy ORM (async)
- **AI Services**: Google Gemini API for image analysis and transcription
- **Image Processing**: PIL for image handling
- **Audio Processing**: SoundDevice for recording, Gemini for transcription

### Frontend (React + TypeScript)
- **Framework**: React 18 with TypeScript
- **Build Tool**: Vite
- **Styling**: Tailwind CSS with Radix UI components
- **Maps**: Leaflet for interactive map display
- **State Management**: React hooks (useState, useEffect, useMemo)

## 📁 Project Structure

```
HTN-2025/
├── backend/                    # FastAPI backend application
│   ├── app/
│   │   ├── models/            # Pydantic models for API
│   │   ├── repository/        # Database access layer
│   │   ├── routers/           # API route handlers
│   │   ├── utils/             # Utility functions
│   │   └── config.py          # Configuration and Supabase setup
│   ├── database/              # Database models and connection
│   ├── images/                # Static image storage
│   └── main.py                # FastAPI application entry point
├── frontend/                  # React frontend application
│   ├── src/
│   │   ├── components/        # React components
│   │   ├── hooks/             # Custom React hooks
│   │   ├── lib/               # Type definitions and utilities
│   │   └── utils/             # API utilities and mock data
│   └── package.json           # Frontend dependencies
└── README.md                  # This file
```

## 🛠️ Setup Instructions

### Prerequisites
- Python 3.11+
- Node.js 18+
- Google API Key (for Gemini AI services)
- Supabase account (optional, for cloud storage)

### Backend Setup

1. **Navigate to backend directory**:
   ```bash
   cd backend
   ```

2. **Install dependencies**:
   ```bash
   uv sync
   ```

3. **Activate virtual environment**:
   - **Windows**: `.venv/scripts/activate.ps1`
   - **macOS/Linux**: `.venv/bin/activate`

4. **Set up environment variables**:
   Create a `.env` file in the root directory:
   ```env
   GOOGLE_API_KEY=your_google_api_key_here
   SUPABASE_URL=your_supabase_url
   SUPABASE_KEY=your_supabase_key
   ```

5. **Run the development server**:
   ```bash
   uv run fastapi dev
   ```

The backend will be available at `http://localhost:8000`

### Frontend Setup

1. **Navigate to frontend directory**:
   ```bash
   cd frontend
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Start development server**:
   ```bash
   npm run dev
   ```

The frontend will be available at `http://localhost:3000`

## 🔧 API Endpoints

### Image Management
- `POST /api/images/` - Create new image record
- `GET /api/images/` - Get all images (with pagination and filtering)
- `GET /api/images/{image_id}` - Get specific image by ID
- `PUT /api/images/{image_id}` - Update image metadata
- `DELETE /api/images/{image_id}` - Delete image record

### Search & Discovery
- `GET /api/images/search/by-tags` - Search images by tags
- `GET /api/images/images_by_audio` - Search images using audio description

### Statistics & Analytics
- `GET /api/images/stats/counts` - Get image statistics (total, tagged, untagged)
- `GET /api/images/stats/locations` - Get image location data for mapping

## 🤖 AI Features

### Image Analysis
- **Automatic Tagging**: Uses Google Gemini to generate descriptive tags
- **Object Detection**: Identifies objects and their locations in images
- **Scene Classification**: Categorizes images by scene type (indoor, outdoor, etc.)
- **Color Analysis**: Extracts dominant colors from images
- **Description Generation**: Creates natural language descriptions

### Audio Processing
- **Voice Recording**: 3-second audio recording capability
- **Speech Transcription**: Converts audio to text using Gemini
- **Audio Search**: Search images using spoken descriptions

### Embeddings & Semantic Search
- **Multi-modal Embeddings**: Generate embeddings for images and text
- **Semantic Search**: Find similar images based on content understanding
- **Vector Storage**: Store embeddings for fast similarity searches

## 🗃️ Database Schema

### ImageModel
```python
id: String (UUID)           # Unique identifier
timestamp: DateTime         # Creation timestamp
tagged: Boolean            # Whether image has been AI-processed
embeddings: JSON           # Vector embeddings for search
description: Text          # AI-generated description
path: String              # File path to image
tags: JSON                # Array of descriptive tags
latitude: Float           # GPS latitude (optional)
longitude: Float          # GPS longitude (optional)
```

## 🎨 Frontend Components

### Core Components
- **MemoryGallery**: Main application container
- **MemoryGrid**: Grid layout for image display
- **MemoryCard**: Individual image card with metadata
- **MemorySearch**: Search interface with filtering
- **Map**: Interactive map showing image locations

### Hooks
- **useMemories**: Manages image data fetching and state
- **useMemorySearch**: Handles search functionality and filtering

## 🔒 Security & Configuration

### Environment Variables
- `GOOGLE_API_KEY`: Required for Gemini AI services
- `SUPABASE_URL`: Optional cloud storage URL
- `SUPABASE_KEY`: Optional cloud storage API key

### CORS Configuration
The backend is configured to accept requests from `http://localhost:3000` for development.

## 🚀 Deployment

### Backend Deployment
1. Set production environment variables
2. Update CORS origins for production domain
3. Configure production database (PostgreSQL recommended)
4. Deploy using Docker or cloud platforms (Railway, Heroku, etc.)

### Frontend Deployment
1. Build the application: `npm run build`
2. Deploy static files to CDN or hosting service
3. Update API base URL for production backend

## 🧪 Development

### Adding New Features
1. **Backend**: Add new routes in `app/routers/`
2. **Database**: Update models in `database/models.py`
3. **Frontend**: Create components in `src/components/`
4. **API Integration**: Add fetch functions in `src/utils/`

### Testing
- Backend: Use FastAPI's built-in testing with pytest
- Frontend: Use Vitest or Jest for component testing

## 📝 License

This project was created for HTN 2025. Please refer to the hackathon guidelines for usage rights.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📞 Support

For questions or issues, please create an issue in the repository or contact the development team. 