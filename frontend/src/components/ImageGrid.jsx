import { useNavigate } from 'react-router-dom';
import './ImageGrid.css';

const ImageGrid = ({ images }) => {
  const navigate = useNavigate();

  const handleImageClick = (imageId) => {
    navigate(`/image/${imageId}`);
  };

  if (images.length === 0) {
    return (
      <div className="no-results">
        <p>No images found matching your search.</p>
      </div>
    );
  }

  return (
    <div className="image-grid">
      {images.map((image) => (
        <div 
          key={image.id} 
          className="image-card"
          onClick={() => handleImageClick(image.id)}
        >
          <img
            src={image.url}
            alt={image.alt}
            className="image"
            loading="lazy"
          />
          <div className="image-info">
            <h3 className="image-title">{image.alt}</h3>
            <div className="image-tags">
              {image.tags.map((tag, index) => (
                <span key={index} className="tag">
                  {tag}
                </span>
              ))}
            </div>
          </div>
        </div>
      ))}
    </div>
  );
};

export default ImageGrid;
