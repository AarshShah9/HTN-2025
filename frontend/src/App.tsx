import './App.css'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import MemoryGallery from './components/MemoryGallery'
import MapPage from './components/MapPage'
import Navigation from './components/Navigation'
import SnapshotsPage from './pages/SnapshotsPage'
import ChatPage from './pages/ChatPage'

function App() {
  return (
    <Router>
      <div className="min-h-screen bg-background">
        <Navigation />
        <Routes>
          <Route path="/" element={<MemoryGallery />} />
          <Route path="/map" element={<MapPage />} />
          <Route path="/snapshots" element={<SnapshotsPage />} />
          <Route path="/chat" element={<ChatPage />} />
        </Routes>
      </div>
    </Router>
  )
}

export default App
