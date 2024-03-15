import 'package:flutter/material.dart';
import 'package:flutter_application_1/Functions/movie_list.dart';

import '../Widgets/movie_poster.dart';
import 'watch_list.dart';

//Created class called WatchListPage, which is a page displaying the watch list movies.
class WatchListPage extends StatelessWidget {
  WatchListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch List'),
      ),
      body: FutureBuilder<List<MovieLists>>(
        future: WatchList.getWatchList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<MovieLists> movies = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MoviePoster(movie: movies[index]);
              },
            );
          }
        },
      ),
    );
  }
}
