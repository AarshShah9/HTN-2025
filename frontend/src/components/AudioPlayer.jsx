import { useState, useRef, useEffect } from 'react';
import './AudioPlayer.css';

const AudioPlayer = ({ audioData, loading }) => {
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);
  const [error, setError] = useState(null);
  const audioRef = useRef(null);

  useEffect(() => {
    const audio = audioRef.current;
    if (!audio) return;

    const updateTime = () => setCurrentTime(audio.currentTime);
    const updateDuration = () => setDuration(audio.duration);
    const handleEnded = () => setIsPlaying(false);
    const handleError = () => {
      setError('Failed to load audio');
      setIsPlaying(false);
    };

    audio.addEventListener('timeupdate', updateTime);
    audio.addEventListener('loadedmetadata', updateDuration);
    audio.addEventListener('ended', handleEnded);
    audio.addEventListener('error', handleError);

    return () => {
      audio.removeEventListener('timeupdate', updateTime);
      audio.removeEventListener('loadedmetadata', updateDuration);
      audio.removeEventListener('ended', handleEnded);
      audio.removeEventListener('error', handleError);
    };
  }, [audioData]);

  const togglePlayPause = () => {
    const audio = audioRef.current;
    if (!audio) return;

    if (isPlaying) {
      audio.pause();
    } else {
      audio.play().catch(() => {
        setError('Failed to play audio');
      });
    }
    setIsPlaying(!isPlaying);
  };

  const handleSeek = (e) => {
    const audio = audioRef.current;
    if (!audio) return;

    const rect = e.currentTarget.getBoundingClientRect();
    const percent = (e.clientX - rect.left) / rect.width;
    const newTime = percent * duration;
    audio.currentTime = newTime;
    setCurrentTime(newTime);
  };

  const formatTime = (time) => {
    if (isNaN(time)) return '0:00';
    const minutes = Math.floor(time / 60);
    const seconds = Math.floor(time % 60);
    return `${minutes}:${seconds.toString().padStart(2, '0')}`;
  };

  if (loading) {
    return (
      <div className="audio-player loading">
        <div className="loading-spinner"></div>
        <span>Loading audio...</span>
      </div>
    );
  }

  if (error) {
    return (
      <div className="audio-player error">
        <span>⚠️ {error}</span>
      </div>
    );
  }

  if (!audioData) {
    return (
      <div className="audio-player error">
        <span>No audio available</span>
      </div>
    );
  }

  return (
    <div className="audio-player">
      <audio ref={audioRef} src={audioData.url} preload="metadata" />
      
      <div className="audio-controls">
        <button 
          className="play-pause-btn"
          onClick={togglePlayPause}
          disabled={!audioData.url}
        >
          {isPlaying ? '⏸️' : '▶️'}
        </button>
        
        <div className="audio-info">
          <div className="audio-title">{audioData.title}</div>
          <div className="audio-progress">
            <div 
              className="progress-bar"
              onClick={handleSeek}
            >
              <div 
                className="progress-fill"
                style={{ width: `${duration ? (currentTime / duration) * 100 : 0}%` }}
              />
            </div>
            <div className="time-display">
              <span>{formatTime(currentTime)}</span>
              <span>/</span>
              <span>{formatTime(duration)}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AudioPlayer;
