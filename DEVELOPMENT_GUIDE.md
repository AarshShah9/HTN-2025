# Development Guide - HTN 2025 Memory Gallery

## Getting Started

This guide provides detailed instructions for setting up the development environment and contributing to the HTN 2025 Memory Gallery project.

## Prerequisites

### Required Software

- **Python 3.11+** - Backend runtime
- **Node.js 18+** - Frontend runtime and package management
- **Git** - Version control
- **uv** - Python package manager (recommended)
- **npm** - Node.js package manager

### API Keys and Services

- **Google API Key** - Required for Gemini AI services
- **Supabase Account** - Optional for cloud storage features

## Development Environment Setup

### 1. Clone the Repository

```bash
git clone <repository-url>
cd HTN-2025
```

### 2. Backend Setup

```bash
# Navigate to backend directory
cd backend

# Install dependencies using uv (recommended)
uv sync

# Alternative: using pip
# pip install -r requirements.txt

# Activate virtual environment
# Windows
.venv/Scripts/activate.ps1
# macOS/Linux
source .venv/bin/activate
```

### 3. Environment Configuration

Create a `.env` file in the project root:

```env
# Required for AI features
GOOGLE_API_KEY=your_google_gemini_api_key

# Optional for cloud features
SUPABASE_URL=your_supabase_project_url
SUPABASE_KEY=your_supabase_anon_key
```

### 4. Database Setup

The application uses SQLite for development, which requires no additional setup. The database will be created automatically when you first run the application.

```bash
# Database will be created at: backend/database/images.db
# Images will be stored in: backend/images/
```

### 5. Frontend Setup

```bash
# Navigate to frontend directory
cd frontend-v2

# Install dependencies
npm install

# Start development server
npm run dev
```

## Running the Application

### Start Backend Server

```bash
cd backend
uv run fastapi dev
# Server runs on http://localhost:8000
```

### Start Frontend Server

```bash
cd frontend-v2
npm run dev
# Server runs on http://localhost:3000
```

### Access Points

- **Frontend Application**: http://localhost:3000
- **Backend API**: http://localhost:8000
- **API Documentation**: http://localhost:8000/docs
- **Alternative Docs**: http://localhost:8000/redoc

## Project Structure Deep Dive

### Backend Architecture

```
backend/
├── app/
│   ├── models/           # Pydantic models for API
│   │   └── models.py     # Request/response models
│   ├── repository/       # Data access layer
│   │   └── image_repository.py  # Image CRUD operations
│   ├── routers/          # API route handlers
│   │   ├── image_db.py   # Main image API endpoints
│   │   ├── image.py      # Image upload endpoints
│   │   ├── audio.py      # Audio processing (placeholder)
│   │   └── video.py      # Video processing (placeholder)
│   ├── utils/            # Utility functions
│   │   ├── tagging.py    # AI image analysis
│   │   ├── transcription.py  # Audio transcription
│   │   ├── image_utils.py     # Image processing
│   │   └── embedding.py       # Vector embeddings
│   └── config.py         # Configuration management
├── database/             # Database layer
│   ├── database.py       # Connection and session management
│   └── models.py         # SQLAlchemy models
├── images/               # Static file storage
└── main.py              # Application entry point
```

### Frontend Architecture

```
frontend-v2/
├── src/
│   ├── components/       # React components
│   │   ├── ui/          # Reusable UI components
│   │   ├── MemoryGallery.tsx    # Main gallery component
│   │   ├── MemoryCard.tsx       # Individual image card
│   │   ├── MemorySearch.tsx     # Search interface
│   │   └── Map.tsx              # Location mapping
│   ├── hooks/            # Custom React hooks
│   │   ├── useMemories.ts       # Image data management
│   │   └── useMemorySearch.ts   # Search functionality
│   ├── lib/              # Utilities and types
│   │   ├── types.ts      # TypeScript definitions
│   │   └── utils.ts      # Helper functions
│   └── utils/            # API and data utilities
│       └── fetchMemories.ts     # API communication
└── package.json          # Dependencies and scripts
```

## Development Workflow

### 1. Feature Development

1. **Create Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Backend Changes**
   - Add new routes in `app/routers/`
   - Update models in `app/models/` or `database/models.py`
   - Add business logic in `app/utils/`
   - Update repository methods if needed

3. **Frontend Changes**
   - Create new components in `src/components/`
   - Add hooks for state management in `src/hooks/`
   - Update types in `src/lib/types.ts`

4. **Testing**
   - Test API endpoints using `/docs` interface
   - Test frontend functionality in browser
   - Verify integration between frontend and backend

### 2. Database Changes

For schema changes:

1. **Update SQLAlchemy Model**
   ```python
   # In database/models.py
   class ImageModel(Base):
       # Add new fields
       new_field = Column(String, nullable=True)
   ```

2. **Delete Existing Database** (Development only)
   ```bash
   rm backend/database/images.db
   # Database will be recreated on next startup
   ```

3. **Update Pydantic Models**
   ```python
   # In app/models/models.py
   class ImageResponse(ImageBase):
       new_field: Optional[str] = None
   ```

### 3. Adding New AI Features

1. **Extend Utility Functions**
   ```python
   # In app/utils/
   def new_ai_function():
       # Implement AI functionality
       pass
   ```

2. **Add API Endpoints**
   ```python
   # In app/routers/
   @router.post("/new-endpoint")
   async def new_endpoint():
       # Use utility functions
       pass
   ```

3. **Update Frontend**
   ```typescript
   // Add new API calls
   // Update UI components
   ```

## Code Style and Standards

### Backend (Python)

- **PEP 8** compliance for formatting
- **Type hints** for all function parameters and returns
- **Docstrings** for all public functions and classes
- **Async/await** for all database operations
- **Error handling** with appropriate HTTP status codes

Example:
```python
async def create_image(
    image_data: ImageCreate,
    repository: ImageRepository = Depends(get_image_repository)
) -> ImageResponse:
    """Create a new image record.
    
    Args:
        image_data: Image creation data
        repository: Image repository instance
        
    Returns:
        ImageResponse: Created image record
        
    Raises:
        HTTPException: If creation fails
    """
    try:
        image = await repository.create_image(**image_data.dict())
        return ImageResponse.from_orm(image)
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
```

### Frontend (TypeScript/React)

- **TypeScript** for type safety
- **Functional components** with hooks
- **Custom hooks** for reusable logic
- **Proper error handling** with user feedback
- **Responsive design** with Tailwind CSS

Example:
```typescript
interface MemoryCardProps {
  memory: MemoryImage;
  onSelect?: (memory: MemoryImage) => void;
}

const MemoryCard: React.FC<MemoryCardProps> = ({ memory, onSelect }) => {
  const handleClick = () => {
    onSelect?.(memory);
  };

  return (
    <div onClick={handleClick} className="cursor-pointer">
      {/* Component content */}
    </div>
  );
};
```

## Testing

### Backend Testing

```bash
# Install test dependencies
pip install pytest pytest-asyncio httpx

# Run tests
pytest tests/

# Test specific endpoint
pytest tests/test_images.py::test_create_image
```

### Frontend Testing

```bash
# Run tests
npm test

# Run tests in watch mode
npm run test:watch

# Generate coverage report
npm run test:coverage
```

### Manual Testing

1. **API Testing**
   - Use FastAPI docs at `/docs`
   - Test with Postman or curl
   - Verify error handling

2. **Frontend Testing**
   - Test all user interactions
   - Verify responsive design
   - Check error states

## Debugging

### Backend Debugging

1. **Enable Debug Logging**
   ```python
   import logging
   logging.basicConfig(level=logging.DEBUG)
   ```

2. **Database Inspection**
   ```bash
   sqlite3 backend/database/images.db
   .tables
   SELECT * FROM images;
   ```

3. **API Debugging**
   - Use FastAPI's automatic validation errors
   - Check server logs for exceptions
   - Use `/docs` for interactive testing

### Frontend Debugging

1. **Browser DevTools**
   - Console for JavaScript errors
   - Network tab for API calls
   - React DevTools extension

2. **State Debugging**
   ```typescript
   console.log('Current state:', { memories, loading, error });
   ```

## Deployment

### Development Deployment

```bash
# Backend
cd backend
uvicorn main:app --host 0.0.0.0 --port 8000

# Frontend
cd frontend-v2
npm run build
npm run preview
```

### Production Considerations

1. **Environment Variables**
   - Set production API keys
   - Configure production database URL
   - Update CORS origins

2. **Database Migration**
   - Switch from SQLite to PostgreSQL
   - Set up database backups
   - Configure connection pooling

3. **Security**
   - Enable HTTPS
   - Add authentication
   - Implement rate limiting
   - Add input validation

## Troubleshooting

### Common Issues

1. **Port Already in Use**
   ```bash
   # Kill process on port 8000
   lsof -ti:8000 | xargs kill -9
   ```

2. **Database Locked**
   ```bash
   # Stop all running processes
   # Delete database file and restart
   rm backend/database/images.db
   ```

3. **Module Not Found**
   ```bash
   # Ensure virtual environment is activated
   # Reinstall dependencies
   uv sync --force
   ```

4. **CORS Errors**
   - Check frontend URL in backend CORS settings
   - Ensure both servers are running
   - Verify API endpoints are correct

### Getting Help

1. **Check Documentation**
   - API docs at `/docs`
   - This development guide
   - README.md for overview

2. **Debug Steps**
   - Check server logs
   - Verify environment variables
   - Test API endpoints individually
   - Check browser console for frontend issues

3. **Community Resources**
   - FastAPI documentation
   - React documentation
   - SQLAlchemy documentation
   - Tailwind CSS documentation

## Contributing Guidelines

### Pull Request Process

1. **Create Feature Branch**
2. **Make Changes with Tests**
3. **Update Documentation**
4. **Submit Pull Request**
5. **Code Review**
6. **Merge to Main**

### Commit Message Format

```
type(scope): description

feat(api): add image search by tags endpoint
fix(ui): resolve memory card loading state
docs(readme): update setup instructions
```

### Code Review Checklist

- [ ] Code follows style guidelines
- [ ] All tests pass
- [ ] Documentation is updated
- [ ] No security vulnerabilities
- [ ] Performance considerations addressed
- [ ] Error handling implemented
- [ ] Type safety maintained
