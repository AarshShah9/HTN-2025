import React from 'react';
import { Link, useLocation } from 'react-router-dom';
import { Button } from './ui/button';
import { MapPin, Grid3X3 } from 'lucide-react';

const Navigation: React.FC = () => {
  const location = useLocation();

  return (
    <nav className="border-b bg-white/95 backdrop-blur supports-[backdrop-filter]:bg-white/60 sticky top-0 z-50">
      <div className="container mx-auto px-4 py-4">
        <div className="flex items-center justify-between">
          <div className="flex items-center space-x-2">
            <h1 className="text-2xl font-bold text-primary">PhotaMems</h1>
          </div>
          
          <div className="flex items-center space-x-2">
            <Button
              variant={location.pathname === '/' ? 'default' : 'ghost'}
              asChild
              className="flex items-center space-x-2"
            >
              <Link to="/">
                <Grid3X3 className="h-4 w-4" />
                <span>Gallery</span>
              </Link>
            </Button>
            
            <Button
              variant={location.pathname === '/map' ? 'default' : 'ghost'}
              asChild
              className="flex items-center space-x-2"
            >
              <Link to="/map">
                <MapPin className="h-4 w-4" />
                <span>Map View</span>
              </Link>
            </Button>
          </div>
        </div>
      </div>
    </nav>
  );
};

export default Navigation;
