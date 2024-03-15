import 'package:flutter/material.dart';
import 'package:flutter_application_1/Functions/movie_list.dart';

import '../Widgets/movie_poster.dart';
import 'watched_list.dart';

//Created class called WatchedListPage, which is a page displaying a list of the watched movies.
class WatchedListPage extends StatelessWidget {
  WatchedListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watched List'),
      ),
      body: FutureBuilder<List<MovieLists>>(
        future: WatchedList.getWatchedList(),
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
