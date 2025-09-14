import React, { useState, useRef, useEffect } from 'react';
import { Button } from './ui/button';
import { Input } from './ui/input';
import { Card, CardContent, CardHeader, CardTitle } from './ui/card';
import { Send, MessageCircle, Bot, User } from 'lucide-react';

interface Message {
  id: string;
  type: 'user' | 'assistant' | 'system' | 'error';
  message: string;
  timestamp: Date;
}

interface ChatInterfaceProps {
  className?: string;
}

const ChatInterface: React.FC<ChatInterfaceProps> = ({ className = '' }) => {
  const [messages, setMessages] = useState<Message[]>([]);
  const [inputValue, setInputValue] = useState('');
  const [isConnected, setIsConnected] = useState(false);
  const [isConnecting, setIsConnecting] = useState(false);
  const [ws, setWs] = useState<WebSocket | null>(null);
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  const connectWebSocket = () => {
    if (isConnecting || isConnected) return;
    
    setIsConnecting(true);
    const websocket = new WebSocket('ws://localhost:8120/chat');
    
    websocket.onopen = () => {
      setIsConnected(true);
      setIsConnecting(false);
      setWs(websocket);
      console.log('Connected to chat agent');
    };
    
    websocket.onmessage = (event) => {
      try {
        const data = JSON.parse(event.data);
        const newMessage: Message = {
          id: Date.now().toString(),
          type: data.type || 'assistant',
          message: data.message || 'No message content',
          timestamp: new Date()
        };
        setMessages(prev => [...prev, newMessage]);
      } catch (error) {
        console.error('Error parsing message:', error);
        const errorMessage: Message = {
          id: Date.now().toString(),
          type: 'error',
          message: 'Failed to parse server response',
          timestamp: new Date()
        };
        setMessages(prev => [...prev, errorMessage]);
      }
    };
    
    websocket.onclose = () => {
      setIsConnected(false);
      setIsConnecting(false);
      setWs(null);
      console.log('Disconnected from chat agent');
      
      const disconnectMessage: Message = {
        id: Date.now().toString(),
        type: 'system',
        message: 'Disconnected from chat agent. Click "Connect" to reconnect.',
        timestamp: new Date()
      };
      setMessages(prev => [...prev, disconnectMessage]);
    };
    
    websocket.onerror = (error) => {
      console.error('WebSocket error:', error);
      setIsConnecting(false);
      
      const errorMessage: Message = {
        id: Date.now().toString(),
        type: 'error',
        message: 'Failed to connect to chat agent. Make sure the agent server is running on port 8120.',
        timestamp: new Date()
      };
      setMessages(prev => [...prev, errorMessage]);
    };
  };

  const disconnectWebSocket = () => {
    if (ws) {
      ws.close();
    }
  };

  const sendMessage = () => {
    if (!inputValue.trim() || !ws || !isConnected) return;
    
    // Add user message to chat
    const userMessage: Message = {
      id: Date.now().toString(),
      type: 'user',
      message: inputValue.trim(),
      timestamp: new Date()
    };
    setMessages(prev => [...prev, userMessage]);
    
    // Send to WebSocket
    try {
      ws.send(JSON.stringify({ message: inputValue.trim() }));
      setInputValue('');
      inputRef.current?.focus();
    } catch (error) {
      console.error('Error sending message:', error);
      const errorMessage: Message = {
        id: Date.now().toString(),
        type: 'error',
        message: 'Failed to send message. Connection may be lost.',
        timestamp: new Date()
      };
      setMessages(prev => [...prev, errorMessage]);
    }
  };

  const handleKeyPress = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      sendMessage();
    }
  };

  const getMessageIcon = (type: string) => {
    switch (type) {
      case 'user':
        return <User className="h-4 w-4" />;
      case 'assistant':
        return <Bot className="h-4 w-4" />;
      case 'system':
        return <MessageCircle className="h-4 w-4" />;
      case 'error':
        return <MessageCircle className="h-4 w-4 text-red-500" />;
      default:
        return <MessageCircle className="h-4 w-4" />;
    }
  };

  const getMessageStyles = (type: string) => {
    switch (type) {
      case 'user':
        return 'bg-blue-500 text-white ml-auto max-w-[80%] word-wrap break-all';
      case 'assistant':
        return 'bg-gray-100 text-gray-900 mr-auto max-w-[80%] word-wrap break-all';
      case 'system':
        return 'bg-yellow-50 text-yellow-800 mx-auto max-w-[90%] text-center word-wrap break-all';
      case 'error':
        return 'bg-red-50 text-red-800 mx-auto max-w-[90%] text-center word-wrap break-all';
      default:
        return 'bg-gray-100 text-gray-900 mr-auto max-w-[80%] word-wrap break-all';
    }
  };

  return (
    <Card className={`flex flex-col h-full ${className}`}>
      <CardHeader className="pb-4">
        <div className="flex items-center justify-between">
          <CardTitle className="flex items-center space-x-2">
            <MessageCircle className="h-5 w-5" />
            <span>Chat with Your Photos</span>
          </CardTitle>
          <div className="flex items-center space-x-2">
            <div className={`h-2 w-2 rounded-full ${isConnected ? 'bg-green-500' : 'bg-red-500'}`} />
            <span className="text-sm text-gray-600">
              {isConnected ? 'Connected' : isConnecting ? 'Connecting...' : 'Disconnected'}
            </span>
            {!isConnected && !isConnecting && (
              <Button size="sm" onClick={connectWebSocket}>
                Connect
              </Button>
            )}
            {isConnected && (
              <Button size="sm" variant="outline" onClick={disconnectWebSocket}>
                Disconnect
              </Button>
            )}
          </div>
        </div>
      </CardHeader>
      
      <CardContent className="flex flex-col flex-1 p-4 space-y-4 overflow-hidden">
        {/* Messages Area */}
        <div className="flex-1 overflow-y-auto min-h-0 border rounded-md">
          <div className="flex flex-col space-y-3 p-4">
            {messages.length === 0 && (
              <div className="flex flex-col items-center justify-center h-full text-gray-500 space-y-2 py-8">
                <Bot className="h-12 w-12 opacity-50" />
                <p className="text-center">
                  Connect to start chatting about your photos!<br />
                  <span className="text-sm">Ask questions like "Show me photos from last week" or "What objects did I photograph?"</span>
                </p>
              </div>
            )}
            
            {messages.map((message) => (
              <div key={message.id} className="flex items-start space-x-2">
                <div className="flex-shrink-0 mt-1">
                  {getMessageIcon(message.type)}
                </div>
                <div className={`rounded-lg px-3 py-2 ${getMessageStyles(message.type)}`}>
                  <p className="text-sm whitespace-pre-wrap break-words">{message.message}</p>
                  <p className="text-xs opacity-70 mt-1">
                    {message.timestamp.toLocaleTimeString()}
                  </p>
                </div>
              </div>
            ))}
            <div ref={messagesEndRef} />
          </div>
        </div>
        
        {/* Input Area */}
        <div className="flex space-x-2 pt-2 border-t">
          <Input
            ref={inputRef}
            value={inputValue}
            onChange={(e) => setInputValue(e.target.value)}
            onKeyPress={handleKeyPress}
            placeholder={isConnected ? "Ask about your photos..." : "Connect to start chatting"}
            disabled={!isConnected}
            className="flex-1"
          />
          <Button
            onClick={sendMessage}
            disabled={!inputValue.trim() || !isConnected}
            size="icon"
          >
            <Send className="h-4 w-4" />
          </Button>
        </div>
      </CardContent>
    </Card>
  );
};

export default ChatInterface;
