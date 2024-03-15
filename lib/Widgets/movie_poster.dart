import 'package:flutter/material.dart';
import 'package:flutter_application_1/Functions/movie_list.dart';

//MoviePoster class was created to show implement the Watch list and Watched list pages
class MoviePoster extends StatelessWidget {
  final MovieLists movie;

  const MoviePoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: AspectRatio(
              aspectRatio:
                  16 / 9, // Specify a fixed aspect ratio for the poster
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            )));
  }
}
