import { useImages } from '../hooks/useImages'
import SearchBar from '../components/SearchBar'
import ImageGrid from '../components/ImageGrid'

const Home = () => {
  const { images, searchQuery, setSearchQuery, filteredCount, totalImages } = useImages()

  return (
    <>
      <header className="app-header">
        <h1>Image Gallery</h1>
        <p>Discover and search through beautiful images</p>
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
    </>
  )
}

export default Home
