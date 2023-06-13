import 'package:flutter_pru/src/models/movies_response.dart';
import 'package:flutter_pru/src/resources/movies_repository.dart';
import 'package:rxdart/subjects.dart';

class MoviesBloc {
  final moviesRepository = MoviesRepository();
  final _moviesGetter = PublishSubject<MoviesResponse>();

  Stream<MoviesResponse> get allMovies => _moviesGetter.stream;

  getAllMovies() async {
    MoviesResponse moviesResponse = await moviesRepository.getMovieList();
    _moviesGetter.sink.add(moviesResponse);
  }

  dispose() {
    _moviesGetter.close();
  }
}

final bloc = MoviesBloc();
