import 'package:flutter_pru/src/models/movies_response.dart';
import 'package:http/http.dart' as http;

class MovieApiSource {
  final _apiKey = '3cbc7db461d8387e94b53f4219d76713';
  final language = 'es-MX';

  Future<MoviesResponse> getMovieList() async {
    var url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=$language&page=1';
    print(url);
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(response.body);
    } else {
      throw Exception('Error al obtener la lista de peliculas');
    }
  }
}
