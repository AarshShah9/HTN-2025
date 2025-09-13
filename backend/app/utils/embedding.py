import vertexai
from vertexai.vision_models import Image, MultiModalEmbeddingModel

vertexai.init(project="htn-2025", location="us-central1")

class Embedder:
    def __init__(self):
        self.model = MultiModalEmbeddingModel.from_pretrained("multimodalembedding@001")

    def embed_content(self, content: str):
        return self.model.get_embeddings(
            image=Image.load_from_file(content),
            contextual_text="Colosseum",
            dimension=1408,
        )