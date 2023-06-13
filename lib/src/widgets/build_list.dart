import 'package:flutter/material.dart';
import 'package:flutter_pru/src/models/movies_response.dart';

Widget buildList(AsyncSnapshot<MoviesResponse> snapshot, BuildContext context) {
  final size = MediaQuery.of(context).size;
  return ListView.builder(
    itemCount: snapshot.data?.results?.length,
    itemBuilder: (context, index) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                '${snapshot.data?.results?[index].title}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w342${snapshot.data?.results?[index].posterPath}',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Text(
                  '${snapshot.data?.results?[index].overview}',
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
