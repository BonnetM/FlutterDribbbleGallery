class Album {
  final String band;
  final String albumCoverUrl;
  final String name;
  final int rating;
  final List<Song> songs;

  Album(this.band, this.albumCoverUrl, this.name, this.rating, this.songs);

  static List<Album> opethAlbums() {
    return [
      Album("Opeth", "https://m.media-amazon.com/images/I/618cPMblYHL._SL1500_.jpg", "Orchid", 2, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/81+o5rqRrDL._SL1400_.jpg", "Morningrise", 3, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/612DbWJ9sdL._SL1070_.jpg", "My Arms, Your Hearse", 5, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/71XzoNNpV1L._SL1304_.jpg", "Still Life", 5, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/81ZPMmsSuhL._SL1500_.jpg", "Blackwater Park", 5, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/81ZyKor9KOL._SL1500_.jpg", "Deliverance", 3, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/71uVfYnR2RL._SL1500_.jpg", "Damnation", 4, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/81KA5Y-50uL._SL1500_.jpg", "Ghost Reveries", 4, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/71Y2nZV5WLL._SL1425_.jpg", "Watershed", 4, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/81MCpRAzjdL._SL1425_.jpg", "Heritage", 2, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/81tSp9BjOrL._SL1425_.jpg", "Pale Communion", 3, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/A1LnRNfHXtL._SL1500_.jpg", "Sorceress", 3, [Song.sampleSong()]),
      Album("Opeth", "https://m.media-amazon.com/images/I/61swdfOIe-L._SL1000_.jpg", "In Cauda Venenum", 3, [Song.sampleSong()]),
    ];
  }
}

class Song {
  final String name;
  final String duration;

  Song(this.name, this.duration);

  static Song sampleSong() {
    return Song("The Night and the Silent Water", "10:59");
  }
}

