import 'package:flutter/material.dart';
import 'package:flutter_application_1/Functions/tv_list.dart';
import 'package:google_fonts/google_fonts.dart';

import '../API/api_key_url.dart';
import '../Functions/movie_list.dart';
import '../Widgets/best_movies.dart';
import '../Widgets/childrens_movies.dart';
import '../Widgets/highest_grossing_movies.dart';
import '../Widgets/tv_shows.dart';
import '../Widgets/cinema_movies.dart';
import '../Screens/search_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  late Future<List<MovieLists>> nowPlayingMovies;
  late Future<List<TVLists>> tvShows;
  late Future<List<MovieLists>> bestMovies;
  late Future<List<MovieLists>> highestGrossMovies;
  late Future<List<MovieLists>> kidsMovies;

  @override
  void initState() {
    super.initState();
    nowPlayingMovies = MyApiKeys().getNowPlayingMovies();
    tvShows = MyApiKeys().getTVShows();
    bestMovies = MyApiKeys().getBestMovies();
    highestGrossMovies = MyApiKeys().getHighestGrossingMovies();
    kidsMovies = MyApiKeys().getChildrenMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 113, 150, 213),
        elevation: 0,
        title: Text('FILM STATION', style: GoogleFonts.audiowide(fontSize: 30)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            SearchBarFunction(),
            const SizedBox(height: 25),
            Text(
              ' Now playing in Cinemas',
              style: GoogleFonts.alkalami(fontSize: 23),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: nowPlayingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return CinemaMovies(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
            Text(
              ' Best Movies of  the year',
              style: GoogleFonts.alkalami(fontSize: 23),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: bestMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return BestMovies(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
            Text(
              ' What is on TV tonight?',
              style: GoogleFonts.alkalami(fontSize: 23),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: tvShows,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return PopularTVShows(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            //const PopularTVShows(),
            const SizedBox(height: 32),
            Text(
              ' Highest-grossing movies',
              style: GoogleFonts.alkalami(fontSize: 23),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: highestGrossMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return HighestGrossingMovies(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
            Text(
              ' Childrens movies',
              style: GoogleFonts.alkalami(fontSize: 23),
            ),
            const SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
                future: kidsMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return ChildrensMovies(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.category),
            ),
            IconButton(
              onPressed: () {
                const Homepage();
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}
