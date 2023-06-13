import 'package:flutter_pru/src/models/movies_response.dart';
import 'package:flutter_pru/src/resources/movie_api_source.dart';

class MoviesRepository {
  final moviesApiSource = MovieApiSource();

  Future<MoviesResponse> getMovieList() => moviesApiSource.getMovieList();
}
