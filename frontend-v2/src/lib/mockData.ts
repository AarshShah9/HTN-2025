import type { MemoryImage } from './types';

export const mockImages: MemoryImage[] = [
  {
    id: '1',
    date: '2024-07-15',
    tags: ['family', 'beach', 'summer', 'sunset'],
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop',
    transcript: 'Today was such a wonderful family beach day. The kids were building the most amazing sandcastles while we watched the beautiful sunset over the ocean. Everyone was laughing and having such a great time together.',
    location: 'Malibu Beach, CA',
    latitude: 34.0259,
    longitude: -118.7798,
    people: ['Mom', 'Dad', 'Emma', 'Jake']
  },

  {
    id: '3',
    date: '2024-05-08',
    tags: ['birthday', 'party', 'friends', 'celebration'],
    imageUrl: 'https://images.unsplash.com/photo-1464349095431-e9a21285b5f3?w=400&h=300&fit=crop',
    transcript: 'Emma\'s 10th birthday party was absolutely incredible! We had cake and games and so much laughter with all her friends. It was such a special celebration.',
    location: 'Home',
    latitude: 34.0522,
    longitude: -118.2437,
    people: ['Emma', 'Friends']
  },
  {
    id: '4',
    date: '2024-08-10',
    tags: ['city', 'night', 'lights', 'urban'],
    imageUrl: 'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=400&h=300&fit=crop',
    transcript: 'Went for a late night walk through downtown. The city lights were absolutely magical and the streets were alive with so much energy and excitement.',
    location: 'Downtown LA',
    latitude: 34.0522,
    longitude: -118.2437,
    people: ['Solo']
  },
  {
    id: '5',
    date: '2024-04-20',
    tags: ['wedding', 'garden', 'flowers', 'ceremony'],
    imageUrl: 'https://images.unsplash.com/photo-1519741497674-611481863552?w=400&h=300&fit=crop',
    transcript: 'Attended this beautiful outdoor wedding ceremony in a rose garden. The flowers were in full bloom and everything was absolutely perfect for the occasion.',
    location: 'Rose Garden, Pasadena',
    latitude: 34.1478,
    longitude: -118.1445,
    people: ['Bride', 'Groom', 'Wedding Party']
  },
  {
    id: '6',
    date: '2024-01-14',
    tags: ['winter', 'cabin', 'snow', 'cozy'],
    imageUrl: 'https://images.unsplash.com/photo-1449844908441-8829872d2607?w=400&h=300&fit=crop',
    transcript: 'Had a cozy weekend getaway in a mountain cabin. We enjoyed hot cocoa by the fireplace and had snowball fights outside in the fresh snow.',
    location: 'Lake Tahoe Cabin',
    latitude: 39.0968,
    longitude: -120.0324,
    people: ['Family']
  },
  {
    id: '7',
    date: '2024-03-12',
    tags: ['art', 'museum', 'culture', 'inspiration'],
    imageUrl: 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400&h=300&fit=crop',
    transcript: 'Spent the afternoon exploring the modern art collection at the museum. There were so many inspiring pieces and creative installations that really sparked my imagination.',
    location: 'Los Angeles County Museum of Art',
    latitude: 34.0639,
    longitude: -118.3592,
    people: ['Solo']
  },
  {
    id: '8',
    date: '2024-09-05',
    tags: ['camping', 'stars', 'night', 'nature'],
    imageUrl: 'https://images.unsplash.com/photo-1504851149312-7a075b496cc7?w=400&h=300&fit=crop',
    transcript: 'Amazing stargazing night during our camping trip. The Milky Way was clearly visible and we even saw several shooting stars across the sky!',
    location: 'Joshua Tree National Park',
    latitude: 33.8734,
    longitude: -115.9009,
    people: ['Friends']
  },
  {
    id: '9',
    date: '2024-02-18',
    tags: ['cooking', 'italian', 'food', 'learning'],
    imageUrl: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&h=300&fit=crop',
    transcript: 'Learned to make authentic Italian pasta from scratch in a cooking class. The chef was amazing and we had so much fun learning new techniques.',
    location: 'Culinary Institute, LA',
    latitude: 34.0522,
    longitude: -118.2437,
    people: ['Cooking Group']
  },
  {
    id: '10',
    date: '2024-07-30',
    tags: ['yoga', 'beach', 'sunrise', 'mindfulness'],
    imageUrl: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400&h=300&fit=crop',
    transcript: 'Peaceful morning yoga session on the beach as the sun rose. It was the perfect way to start the day with mindfulness and tranquility.',
    location: 'Venice Beach, CA',
    latitude: 33.9850,
    longitude: -118.4695,
    people: ['Yoga Group']
  }
];
