import React from 'react';
import ChatInterface from '../components/ChatInterface';

const ChatPage: React.FC = () => {
  return (
    <div className="container mx-auto px-4 py-6 h-[calc(100vh-80px)]">
      <div className="max-w-4xl mx-auto h-full">
        <div className="mb-6">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">
            Chat with Your Photos
          </h1>
          <p className="text-gray-600">
            Ask questions about your image collection, find specific photos, or discover insights about objects you've captured.
          </p>
        </div>
        
        <div className="h-[calc(100%-120px)]">
          <ChatInterface className="h-full" />
        </div>
        
        <div className="mt-4 text-sm text-gray-500">
          <p className="mb-2"><strong>Try asking:</strong></p>
          <ul className="list-disc list-inside space-y-1">
            <li>"What photos do I have from last week?"</li>
            <li>"Show me images with cars in them"</li>
            <li>"What objects appear most frequently in my photos?"</li>
            <li>"Find photos taken at a specific location"</li>
            <li>"What's in my most recent photos?"</li>
          </ul>
        </div>
      </div>
    </div>
  );
};

export default ChatPage;
