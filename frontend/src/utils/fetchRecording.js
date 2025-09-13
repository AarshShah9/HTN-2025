// Mock audio URLs for demonstration - in a real app, these would come from your backend
const mockAudioData = {
  1: 'https://www.soundjay.com/misc/sounds/bell-ringing-05.wav',
  2: 'https://www.soundjay.com/misc/sounds/bell-ringing-05.wav',
  3: 'https://www.soundjay.com/misc/sounds/bell-ringing-05.wav',
  4: 'https://www.soundjay.com/misc/sounds/bell-ringing-05.wav',
  5: 'https://www.soundjay.com/misc/sounds/bell-ringing-05.wav',
  6: 'https://www.soundjay.com/misc/sounds/bell-ringing-05.wav'
};

/**
 * Fetches audio recording for a given image ID
 * @param {number} imageId - The ID of the image
 * @returns {Promise<Object>} Audio object with URL and metadata
 */
export const fetchRecording = async (imageId) => {
  try {
    // Simulate API delay
    await new Promise(resolve => setTimeout(resolve, 500));
    
    // In a real application, this would make an API call to your backend
    // const response = await fetch(`/api/recordings/${imageId}`);
    // const audioData = await response.json();
    
    // For now, return mock data
    const audioUrl = mockAudioData[imageId];
    
    if (!audioUrl) {
      throw new Error(`No audio found for image ID: ${imageId}`);
    }
    
    return {
      id: imageId,
      url: audioUrl,
      title: `Audio for Image ${imageId}`,
      duration: null, // Will be determined when audio loads
      type: 'audio/wav'
    };
  } catch (error) {
    console.error('Error fetching recording:', error);
    throw error;
  }
};
