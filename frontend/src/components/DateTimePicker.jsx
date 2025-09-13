import { useState } from 'react';
import './DateTimePicker.css';

const DateTimePicker = ({ selectedRange, onRangeChange, onClose, isOpen }) => {
  const [localDate, setLocalDate] = useState(
    selectedRange?.centerDate ? new Date(selectedRange.centerDate).toISOString().split('T')[0] : ''
  );
  const [localTime, setLocalTime] = useState(
    selectedRange?.centerDate ? new Date(selectedRange.centerDate).toTimeString().slice(0, 5) : '12:00'
  );
  const [rangeHours, setRangeHours] = useState(selectedRange?.hours || 2);
  const [rangeMinutes, setRangeMinutes] = useState(selectedRange?.minutes || 0);

  const handleApply = () => {
    if (localDate) {
      const centerDateTime = new Date(`${localDate}T${localTime}:00.000Z`);
      const totalMinutes = rangeHours * 60 + rangeMinutes;
      
      const startTime = new Date(centerDateTime.getTime() - (totalMinutes * 60 * 1000) / 2);
      const endTime = new Date(centerDateTime.getTime() + (totalMinutes * 60 * 1000) / 2);
      
      onRangeChange({
        centerDate: centerDateTime.toISOString(),
        startTime: startTime.toISOString(),
        endTime: endTime.toISOString(),
        hours: rangeHours,
        minutes: rangeMinutes
      });
    }
    onClose();
  };

  const handleClear = () => {
    setLocalDate('');
    setLocalTime('12:00');
    setRangeHours(2);
    setRangeMinutes(0);
    onRangeChange(null);
    onClose();
  };

  const handleCancel = () => {
    // Reset to original values
    if (selectedRange) {
      setLocalDate(new Date(selectedRange.centerDate).toISOString().split('T')[0]);
      setLocalTime(new Date(selectedRange.centerDate).toTimeString().slice(0, 5));
      setRangeHours(selectedRange.hours);
      setRangeMinutes(selectedRange.minutes);
    } else {
      setLocalDate('');
      setLocalTime('12:00');
      setRangeHours(2);
      setRangeMinutes(0);
    }
    onClose();
  };

  const formatRangeDisplay = () => {
    if (!localDate) return '';
    
    const centerDateTime = new Date(`${localDate}T${localTime}:00.000Z`);
    const totalMinutes = rangeHours * 60 + rangeMinutes;
    const startTime = new Date(centerDateTime.getTime() - (totalMinutes * 60 * 1000) / 2);
    const endTime = new Date(centerDateTime.getTime() + (totalMinutes * 60 * 1000) / 2);
    
    return `${startTime.toLocaleString()} - ${endTime.toLocaleString()}`;
  };

  if (!isOpen) return null;

  return (
    <div className="datetime-picker-overlay" onClick={onClose}>
      <div className="datetime-picker-popup" onClick={(e) => e.stopPropagation()}>
        <div className="datetime-picker-header">
          <h3>Select Time Range</h3>
          <button className="close-btn" onClick={onClose}>×</button>
        </div>
        
        <div className="datetime-picker-content">
          <div className="date-input-group">
            <label htmlFor="date-input">Center Date</label>
            <input
              id="date-input"
              type="date"
              value={localDate}
              onChange={(e) => setLocalDate(e.target.value)}
              className="date-input"
            />
          </div>
          
          <div className="time-input-group">
            <label htmlFor="time-input">Center Time</label>
            <input
              id="time-input"
              type="time"
              value={localTime}
              onChange={(e) => setLocalTime(e.target.value)}
              className="time-input"
            />
          </div>
          
          <div className="range-controls">
            <h4>Time Range</h4>
            <div className="range-inputs">
              <div className="range-input-group">
                <label htmlFor="hours-input">Hours</label>
                <input
                  id="hours-input"
                  type="number"
                  min="0"
                  max="24"
                  value={rangeHours}
                  onChange={(e) => setRangeHours(parseInt(e.target.value) || 0)}
                  className="range-input"
                />
              </div>
              <div className="range-input-group">
                <label htmlFor="minutes-input">Minutes</label>
                <input
                  id="minutes-input"
                  type="number"
                  min="0"
                  max="59"
                  step="15"
                  value={rangeMinutes}
                  onChange={(e) => setRangeMinutes(parseInt(e.target.value) || 0)}
                  className="range-input"
                />
              </div>
            </div>
            <div className="range-description">
              ± {rangeHours}h {rangeMinutes}m from center time
            </div>
          </div>
          
          {localDate && (
            <div className="current-selection">
              <span>Range: {formatRangeDisplay()}</span>
            </div>
          )}
        </div>
        
        <div className="datetime-picker-actions">
          <button className="btn-secondary" onClick={handleClear}>
            Clear
          </button>
          <button className="btn-secondary" onClick={handleCancel}>
            Cancel
          </button>
          <button className="btn-primary" onClick={handleApply}>
            Apply
          </button>
        </div>
      </div>
    </div>
  );
};

export default DateTimePicker;
