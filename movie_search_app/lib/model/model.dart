class MovieData {
  final String title;
  final String year;
  final String runtime;
  final String released;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String imdScore;
  final String rottemTomatoScore;
  final String metacriticScore;
  final String imdbRating;
  final String imdbID;
  final String type;
  final String dvd;
  final String boxOffice;

  MovieData(
      {required this.title,
      required this.year,
      required this.runtime,
      required this.released,
      required this.genre,
      required this.director,
      required this.writer,
      required this.actors,
      required this.plot,
      required this.language,
      required this.country,
      required this.awards,
      required this.poster,
      required this.imdScore,
      required this.rottemTomatoScore,
      required this.metacriticScore,
      required this.imdbRating,
      required this.imdbID,
      required this.type,
      required this.dvd,
      required this.boxOffice});

  factory MovieData.info(dynamic decodedData) {
    return MovieData(
        title: decodedData['Title'],
        year: decodedData['Year'],
        runtime: decodedData['Runtime'],
        released: decodedData['Released'],
        genre: decodedData['Genre'],
        director: decodedData['Director'],
        writer: decodedData['Writer'],
        actors: decodedData['Actors'],
        plot: decodedData['Plot'],
        language: decodedData['Language'],
        country: decodedData['Country'],
        awards: decodedData['Awards'],
        poster: decodedData['Poster'],
        imdScore: decodedData['Ratings'][0]['Value'],
        rottemTomatoScore: decodedData['Ratings'][1]['Value'],
        metacriticScore: decodedData['Ratings'][2]['Value'],
        imdbRating: decodedData['imdbRating'],
        imdbID: decodedData['imdbVotes'],
        type: decodedData['Type'],
        dvd: decodedData['DVD'],
        boxOffice: decodedData['BoxOffice']);
  }
}
