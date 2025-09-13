import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Home from './pages/Home'
import ImageDetail from './pages/ImageDetail'
import './App.css'

function App() {
  return (
    <Router>
      <div className="app">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/image/:id" element={<ImageDetail />} />
        </Routes>
      </div>
    </Router>
  )
}

export default App
