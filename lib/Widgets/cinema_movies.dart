import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CinemaMovies extends StatelessWidget {
  const CinemaMovies({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: snapshot.data.length,
          options: CarouselOptions(
            height: 800,
            autoPlay: true,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
          itemBuilder: (context, index, pageViewIndex) {
            //final MovieLists = snapshot.data[index];

            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                  height: 800,
                  width: 600,
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      'https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}')),
            );
          }),
    );
  }
}
