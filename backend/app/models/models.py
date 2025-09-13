from pydantic import BaseModel

class Image(BaseModel):
    id: str
    url: str
    description: str
    created_at: str
    tags: list[str]
