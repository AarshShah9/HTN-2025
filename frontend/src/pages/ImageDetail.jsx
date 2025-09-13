import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useImages } from '../hooks/useImages';
import { fetchRecording } from '../utils/fetchRecording';
import AudioPlayer from '../components/AudioPlayer';
import './ImageDetail.css';

const ImageDetail = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const { images } = useImages();
  const [audioData, setAudioData] = useState(null);
  const [audioLoading, setAudioLoading] = useState(true);
  const [audioError, setAudioError] = useState(null);

  // Find the image by ID
  const image = images.find(img => img.id === parseInt(id));

  useEffect(() => {
    if (!image) return;

    const loadAudio = async () => {
      try {
        setAudioLoading(true);
        setAudioError(null);
        const audio = await fetchRecording(image.id);
        setAudioData(audio);
      } catch (error) {
        setAudioError(error.message);
      } finally {
        setAudioLoading(false);
      }
    };

    loadAudio();
  }, [image]);

  if (!image) {
    return (
      <div className="image-detail-container">
        <div className="error-message">
          <h2>Image not found</h2>
          <button onClick={() => navigate('/')} className="back-btn">
            ← Back to Gallery
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="image-detail-container">
      <header className="detail-header">
        <button onClick={() => navigate('/')} className="back-btn">
          ← Back to Gallery
        </button>
        <h1>Image Details</h1>
      </header>

      <main className="detail-main">
        <div className="image-section">
          <img
            src={image.url}
            alt={image.alt}
            className="detail-image"
          />
          <div className="image-meta">
            <h2>{image.alt}</h2>
            <div className="image-tags">
              {image.tags.map((tag, index) => (
                <span key={index} className="tag">
                  {tag}
                </span>
              ))}
            </div>
          </div>
        </div>

        <div className="audio-section">
          <h3>Audio Recording</h3>
          <AudioPlayer 
            audioData={audioData}
            loading={audioLoading}
            error={audioError}
          />
        </div>
      </main>
    </div>
  );
};

export default ImageDetail;
