import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_application_1/Screens/details_page_for_movies.dart';

class CinemaMovies extends StatelessWidget {
  const CinemaMovies({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    double carouselHeight = kIsWeb ? 900 : 300;
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: snapshot.data.length,
          options: CarouselOptions(
            height: carouselHeight,
            autoPlay: true,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
          itemBuilder: (context, index, pageViewIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(movie: snapshot.data[index]),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                    height: kIsWeb ? 800 : 600,
                    width: kIsWeb ? 600 : double.infinity,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}')),
              ),
            );
          }),
    );
  }
}
