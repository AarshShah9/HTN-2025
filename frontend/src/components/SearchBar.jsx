import './SearchBar.css';

const SearchBar = ({ searchQuery, setSearchQuery, filteredCount, totalImages }) => {
  return (
    <div className="search-bar-container">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search by tags: nature, mountain OR audio: describe what you heard..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="search-input"
        />
        <div className="search-icon">🔍</div>
      </div>
      <div className="search-results-info">
        {searchQuery && (
          <span>
            Showing {filteredCount} of {totalImages} images
          </span>
        )}
      </div>
    </div>
  );
};

export default SearchBar;
