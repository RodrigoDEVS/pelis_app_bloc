import 'package:flutter/material.dart';
import 'package:flutter_pru/src/blocs/movies_bloc.dart';
import 'package:flutter_pru/src/models/movies_response.dart';
import 'package:flutter_pru/src/widgets/build_list.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    bloc.getAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Películas'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (_, AsyncSnapshot<MoviesResponse> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot, context);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
