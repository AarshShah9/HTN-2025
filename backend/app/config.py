import os

from dotenv import load_dotenv
from supabase import Client, create_client

# Load environment variables from .env file in root
load_dotenv(os.path.join(os.path.dirname(__file__), "..", "..", ".env"))

# Supabase setup
SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_KEY")
if not SUPABASE_URL or not SUPABASE_KEY:
    raise ValueError("SUPABASE_URL and SUPABASE_KEY must be set in .env file")

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)
supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)
