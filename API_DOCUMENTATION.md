# API Documentation - HTN 2025 Memory Gallery

## Overview

This document provides comprehensive API documentation for the HTN 2025 Memory Gallery backend service. The API is built with FastAPI and provides endpoints for image management, AI-powered analysis, and search functionality.

**Base URL:** `http://localhost:8000`  
**API Prefix:** `/api/images`  
**Documentation:** `http://localhost:8000/docs` (Swagger UI)  
**Alternative Docs:** `http://localhost:8000/redoc` (ReDoc)

## Authentication

Currently, the API does not require authentication. In a production environment, consider implementing:
- JWT tokens for user authentication
- API keys for service-to-service communication
- Rate limiting to prevent abuse

## Data Models

### ImageResponse

```json
{
  "id": "string (UUID)",
  "path": "string",
  "description": "string | null",
  "tags": ["string"],
  "embeddings": "object | null",
  "tagged": "boolean",
  "timestamp": "string (ISO 8601)",
  "latitude": "number | null",
  "longitude": "number | null"
}
```

### ImageCreate

```json
{
  "path": "string (required)",
  "description": "string | null",
  "tags": ["string"],
  "embeddings": "object | null",
  "tagged": "boolean"
}
```

### ImageUpdate

```json
{
  "description": "string | null",
  "tags": ["string"] | null,
  "embeddings": "object | null",
  "tagged": "boolean | null"
}
```

## Endpoints

### 1. Create Image Record

**POST** `/api/images/`

Creates a new image record in the database.

**Request Body:**
```json
{
  "path": "images/photo_001.jpg",
  "description": "A beautiful sunset over the mountains",
  "tags": ["sunset", "mountains", "landscape"],
  "tagged": true
}
```

**Response:** `201 Created`
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "path": "images/photo_001.jpg",
  "description": "A beautiful sunset over the mountains",
  "tags": ["sunset", "mountains", "landscape"],
  "embeddings": null,
  "tagged": true,
  "timestamp": "2025-01-15T10:30:00Z",
  "latitude": null,
  "longitude": null
}
```

**Error Responses:**
- `400 Bad Request` - Invalid input data
- `500 Internal Server Error` - Database error

---

### 2. Get Single Image

**GET** `/api/images/{image_id}`

Retrieves a specific image by its ID.

**Path Parameters:**
- `image_id` (string, required) - UUID of the image

**Response:** `200 OK`
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "path": "images/photo_001.jpg",
  "description": "A beautiful sunset over the mountains",
  "tags": ["sunset", "mountains", "landscape"],
  "embeddings": null,
  "tagged": true,
  "timestamp": "2025-01-15T10:30:00Z",
  "latitude": 37.7749,
  "longitude": -122.4194
}
```

**Error Responses:**
- `404 Not Found` - Image not found

---

### 3. Get All Images

**GET** `/api/images/`

Retrieves a paginated list of images with optional filtering.

**Query Parameters:**
- `skip` (integer, optional, default: 0) - Number of records to skip
- `limit` (integer, optional, default: 100) - Maximum number of records to return
- `tagged_only` (boolean, optional) - Filter by tagged status
  - `true` - Only tagged images
  - `false` - Only untagged images
  - `null` - All images

**Example Requests:**
```
GET /api/images/
GET /api/images/?skip=20&limit=50
GET /api/images/?tagged_only=true
```

**Response:** `200 OK`
```json
[
  {
    "id": "123e4567-e89b-12d3-a456-426614174000",
    "path": "images/photo_001.jpg",
    "description": "A beautiful sunset over the mountains",
    "tags": ["sunset", "mountains", "landscape"],
    "embeddings": null,
    "tagged": true,
    "timestamp": "2025-01-15T10:30:00Z",
    "latitude": 37.7749,
    "longitude": -122.4194
  }
]
```

---

### 4. Search Images by Tags

**GET** `/api/images/search/by-tags`

Searches for images that contain any of the specified tags.

**Query Parameters:**
- `tags` (string, required) - Comma-separated list of tags to search for
- `skip` (integer, optional, default: 0) - Number of records to skip
- `limit` (integer, optional, default: 100) - Maximum number of records to return

**Example Requests:**
```
GET /api/images/search/by-tags?tags=sunset,mountains
GET /api/images/search/by-tags?tags=landscape&skip=10&limit=20
```

**Response:** `200 OK`
```json
[
  {
    "id": "123e4567-e89b-12d3-a456-426614174000",
    "path": "images/photo_001.jpg",
    "description": "A beautiful sunset over the mountains",
    "tags": ["sunset", "mountains", "landscape"],
    "embeddings": null,
    "tagged": true,
    "timestamp": "2025-01-15T10:30:00Z",
    "latitude": 37.7749,
    "longitude": -122.4194
  }
]
```

**Error Responses:**
- `400 Bad Request` - No tags provided

---

### 5. Update Image

**PUT** `/api/images/{image_id}`

Updates an existing image record.

**Path Parameters:**
- `image_id` (string, required) - UUID of the image

**Request Body:**
```json
{
  "description": "Updated description",
  "tags": ["new", "tags"],
  "tagged": true
}
```

**Response:** `200 OK`
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "path": "images/photo_001.jpg",
  "description": "Updated description",
  "tags": ["new", "tags"],
  "embeddings": null,
  "tagged": true,
  "timestamp": "2025-01-15T10:30:00Z",
  "latitude": 37.7749,
  "longitude": -122.4194
}
```

**Error Responses:**
- `404 Not Found` - Image not found
- `400 Bad Request` - Invalid input data

---

### 6. Delete Image

**DELETE** `/api/images/{image_id}`

Deletes an image record from the database.

**Path Parameters:**
- `image_id` (string, required) - UUID of the image

**Response:** `204 No Content`

**Error Responses:**
- `404 Not Found` - Image not found

---

### 7. Get Image Statistics

**GET** `/api/images/stats/counts`

Retrieves statistics about the image collection.

**Response:** `200 OK`
```json
{
  "total_images": 150,
  "tagged_images": 120,
  "untagged_images": 30
}
```

---

### 8. Get Image Locations

**GET** `/api/images/stats/locations`

Retrieves location data for images that have GPS coordinates.

**Response:** `200 OK`
```json
[
  [37.7749, -122.4194],
  [40.7128, -74.0060],
  [51.5074, -0.1278]
]
```

---

### 9. Search by Audio Description

**GET** `/api/images/images_by_audio`

Searches for images based on audio description (placeholder endpoint).

**Query Parameters:**
- `audio_description` (string, required) - Text description from audio transcription

**Response:** `200 OK`
```json
{
  "message": "Audio search functionality coming soon",
  "query": "audio description text"
}
```

---

### 10. Root Endpoint

**GET** `/`

Provides basic API information and health check.

**Response:** `200 OK`
```json
{
  "message": "HTN 2025 - AI-Powered Memory Gallery API",
  "version": "1.0.0",
  "status": "active",
  "docs": "/docs"
}
```

## Error Handling

The API uses standard HTTP status codes and returns error details in JSON format:

```json
{
  "detail": "Error message describing what went wrong"
}
```

### Common Status Codes

- `200 OK` - Request successful
- `201 Created` - Resource created successfully
- `204 No Content` - Request successful, no content to return
- `400 Bad Request` - Invalid request data
- `404 Not Found` - Resource not found
- `422 Unprocessable Entity` - Validation error
- `500 Internal Server Error` - Server error

## Rate Limiting

Currently, no rate limiting is implemented. For production use, consider:

- **Per-IP limits:** 100 requests per minute
- **Per-endpoint limits:** Stricter limits on expensive operations
- **Burst allowance:** Allow short bursts of activity

## CORS Configuration

The API is configured to accept requests from:
- `http://localhost:3000` (development frontend)

For production, update the CORS origins in `main.py`:

```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://yourdomain.com"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

## File Upload

Static image files are served from the `/images` endpoint:

**GET** `/images/{filename}`

Example: `http://localhost:8000/images/photo_001.jpg`

## AI Integration

The API integrates with several AI services:

### Google Gemini API
- **Image Analysis:** Automatic tagging and description generation
- **Audio Transcription:** Convert speech to text for search
- **Embeddings:** Generate vector representations for semantic search

### Configuration
Set environment variables:
```bash
GOOGLE_API_KEY=your_google_api_key
```

## Database Schema

The API uses SQLite with the following table structure:

```sql
CREATE TABLE images (
    id VARCHAR(36) PRIMARY KEY,
    timestamp DATETIME NOT NULL,
    tagged BOOLEAN NOT NULL DEFAULT FALSE,
    embeddings JSON,
    description TEXT,
    path VARCHAR(500) NOT NULL,
    tags JSON NOT NULL DEFAULT '[]',
    latitude FLOAT,
    longitude FLOAT
);
```

## SDK Examples

### Python

```python
import requests

# Create image
response = requests.post(
    "http://localhost:8000/api/images/",
    json={
        "path": "images/test.jpg",
        "description": "Test image",
        "tags": ["test"]
    }
)
image = response.json()

# Get all images
response = requests.get("http://localhost:8000/api/images/")
images = response.json()

# Search by tags
response = requests.get(
    "http://localhost:8000/api/images/search/by-tags",
    params={"tags": "sunset,landscape"}
)
results = response.json()
```

### JavaScript

```javascript
// Create image
const response = await fetch('http://localhost:8000/api/images/', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    path: 'images/test.jpg',
    description: 'Test image',
    tags: ['test']
  })
});
const image = await response.json();

// Get all images
const imagesResponse = await fetch('http://localhost:8000/api/images/');
const images = await imagesResponse.json();

// Search by tags
const searchResponse = await fetch(
  'http://localhost:8000/api/images/search/by-tags?tags=sunset,landscape'
);
const results = await searchResponse.json();
```

## Testing

Use the interactive API documentation at `http://localhost:8000/docs` to test endpoints directly in your browser.

For automated testing, consider using:
- **pytest** for Python backend tests
- **Postman** for API testing
- **curl** for command-line testing

## Deployment Considerations

### Production Checklist

1. **Database:** Migrate from SQLite to PostgreSQL
2. **Environment Variables:** Set all required API keys
3. **CORS:** Update allowed origins for production domain
4. **HTTPS:** Enable SSL/TLS encryption
5. **Rate Limiting:** Implement request throttling
6. **Monitoring:** Add logging and error tracking
7. **Backup:** Implement database backup strategy

### Docker Deployment

```dockerfile
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

## Support

For API support and questions:
- Check the interactive documentation at `/docs`
- Review this documentation
- Create an issue in the project repository
