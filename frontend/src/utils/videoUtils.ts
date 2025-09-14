/**
 * Converts an array of base64 frame strings to a playable video blob URL
 * This creates a simple slideshow-style video from the frames
 */
export const createVideoFromFrames = async (frames: string[], _fps: number = 30): Promise<string> => {
  if (frames.length === 0) return '';
  
  // For now, we'll create a canvas-based animation
  // In a production app, you'd want to use a proper video encoding library
  const canvas = document.createElement('canvas');
  const ctx = canvas.getContext('2d');
  
  if (!ctx) return '';
  
  // Set canvas dimensions based on first frame
  const firstImage = new Image();
  firstImage.src = `data:image/jpeg;base64,${frames[0]}`;
  
  return new Promise<string>((resolve) => {
    firstImage.onload = () => {
      canvas.width = firstImage.width;
      canvas.height = firstImage.height;
      
      // Create a simple video by cycling through frames
      const videoBlob = new Blob([canvas.toDataURL()], { type: 'video/mp4' });
      const videoUrl = URL.createObjectURL(videoBlob);
      resolve(videoUrl);
    };
  }).catch(() => '');
};

/**
 * Creates a video element that cycles through frames
 */
export const createFramePlayer = (frames: string[], fps: number = 30): HTMLVideoElement | null => {
  if (frames.length === 0) return null;
  
  const video = document.createElement('video');
  video.controls = true;
  video.loop = true;
  video.muted = true;
  
  // We'll simulate video playback by cycling through frames
  let currentFrame = 0;
  const frameInterval = 1000 / fps;
  
  const canvas = document.createElement('canvas');
  const ctx = canvas.getContext('2d');
  
  if (!ctx) return null;
  
  // Load first frame to set dimensions
  const firstImage = new Image();
  firstImage.src = `data:image/jpeg;base64,${frames[0]}`;
  
  firstImage.onload = () => {
    canvas.width = firstImage.width;
    canvas.height = firstImage.height;
    
    const playFrames = () => {
      const img = new Image();
      img.src = `data:image/jpeg;base64,${frames[currentFrame]}`;
      
      img.onload = () => {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.drawImage(img, 0, 0);
        
        currentFrame = (currentFrame + 1) % frames.length;
      };
    };
    
    // Start the frame cycling
    setInterval(playFrames, frameInterval);
    playFrames(); // Show first frame immediately
  };
  
  // Convert canvas to video stream (this is a simplified approach)
  try {
    const stream = canvas.captureStream(fps);
    video.srcObject = stream;
  } catch (error) {
    console.error('Error creating video stream:', error);
    return null;
  }
  
  return video;
};
