import { useState } from 'react'
import { useImages } from '../hooks/useImages'
import SearchBar from '../components/SearchBar'
import ImageGrid from '../components/ImageGrid'
import DateTimePicker from '../components/DateTimePicker'
import './Home.css'

const Home = () => {
  const { images, searchQuery, setSearchQuery, selectedRange, setSelectedRange, filteredCount, totalImages } = useImages()
  const [isDatePickerOpen, setIsDatePickerOpen] = useState(false)

  const handleRangeChange = (range) => {
    setSelectedRange(range)
  }

  const clearRangeFilter = () => {
    setSelectedRange(null)
  }

  return (
    <>
      <header className="app-header">
        <div className="header-content">
          <div className="header-text">
            <h1>Image Gallery</h1>
            <p>Discover and search through beautiful images</p>
          </div>
          <button 
            className="calendar-btn"
            onClick={() => setIsDatePickerOpen(true)}
            title="Filter by date"
          >
            📅
          </button>
        </div>
        
        {selectedRange && (
          <div className="date-filter-indicator">
            <span>
              Range: ±{selectedRange.hours}h {selectedRange.minutes}m from {new Date(selectedRange.centerDate).toLocaleString()}
            </span>
            <button className="clear-date-btn" onClick={clearRangeFilter}>
              ✕
            </button>
          </div>
        )}
      </header>
      
      <main className="app-main">
        <SearchBar 
          searchQuery={searchQuery}
          setSearchQuery={setSearchQuery}
          filteredCount={filteredCount}
          totalImages={totalImages}
        />
        
        <ImageGrid images={images} />
      </main>
      
      <DateTimePicker
        selectedRange={selectedRange}
        onRangeChange={handleRangeChange}
        onClose={() => setIsDatePickerOpen(false)}
        isOpen={isDatePickerOpen}
      />
    </>
  )
}

export default Home
