import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_search_app/model/model.dart';

enum loadingState { preloading, isLoading, loadedWithData, loadedWithErrors }

class ApiCall {
  late Function LoadingState;
  loadingState isLoading = loadingState.preloading;
  late String title;
  String year = '';
  String runtime = '';
  String released = '';
  String genre = '';
  String director = '';
  String writer = '';
  String actors = '';
  String plot = '';
  String language = '';
  String country = '';
  String awards = '';
  String poster = '';
  String imdScore = '';
  String rottemTomatoScore = '';
  String metacriticScore = '';
  String imdbRating = '';
  String imdbID = '';
  String type = '';
  String dvd = '';
  String boxOffice = '';
  Future getMovieData(String movieName) async {
    try {
      isLoading = loadingState.isLoading;
      LoadingState();
      Response movieInfo = await get(Uri.parse(
          'https://www.omdbapi.com/?t=$movieName&apikey=9fb8d9e0&plot=full'));
      dynamic decodedData = jsonDecode(movieInfo.body);
      MovieData movieData = MovieData.info(decodedData);
      title = movieData.title;
      year = movieData.year;
      runtime = movieData.runtime;
      released = movieData.released;
      genre = movieData.genre;
      director = movieData.director;
      writer = movieData.writer;
      actors = movieData.actors;
      plot = movieData.plot;
      language = movieData.language;
      country = movieData.country;
      awards = movieData.awards;
      poster = movieData.poster;
      imdScore = movieData.imdScore;
      rottemTomatoScore = movieData.rottemTomatoScore;
      metacriticScore = movieData.metacriticScore;
      imdbRating = movieData.imdbRating;
      imdbID = movieData.imdbID;
      type = movieData.type;
      boxOffice = movieData.boxOffice;
      isLoading = loadingState.loadedWithData;
      LoadingState();
    } catch (e) {
      isLoading = loadingState.loadedWithErrors;
      LoadingState();
    }
  }
}
