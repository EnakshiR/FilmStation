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
import 'login_page.dart';
import 'watch_list_page.dart';
import 'watched_list_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  //Variables are declared to hold asynchronous operations for fetching movie and TV show data.
  late Future<List<MovieLists>> nowPlayingMovies;
  late Future<List<TVLists>> tvShows;
  late Future<List<MovieLists>> bestMovies;
  late Future<List<MovieLists>> highestGrossMovies;
  late Future<List<MovieLists>> kidsMovies;

  @override
  void initState() {
    //The above asynchronous operations are initialized by calling methods from the MyApiKeys class.
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
        backgroundColor: const Color.fromARGB(255, 113, 150, 213),
        elevation: 0,
        title: Text('FILM STATION', style: GoogleFonts.audiowide(fontSize: 30)),
        centerTitle: true,
      ), //The application name will appear on top of the Home Page
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            SearchBarFunction(), //The search bar is implemented and displayed just below the app name
            const SizedBox(height: 25),
            //Displays the 'Now playing in Cinemas' movies
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
                    return const Center(
                        child:
                            CircularProgressIndicator()); //The buffering icon will show when there is a delay in loading the movies and tv shows
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
            //Displays the 'Best Movies of the year' movies
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
            //Displays the 'What is on TV tonight?' movies
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
            const SizedBox(height: 32),
            //Displays the 'Highest-grossing movies' movies
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
            //Displays the 'Childrens movies' movies
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
            const SizedBox(height: 32),
            //The LOGOUT button is displayed and implemented
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage())); //After LOGOUT is pressed it will direct the user to Lohin Page
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black26;
                      }
                      return Color.fromARGB(255, 1, 102, 72);
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                child: Text(
                  'LOG OUT',
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      //Implementing the Navigation Bar at the bottom of the screen
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //When watch List icon is pressed,it directs you to the Watch List Page
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WatchListPage()));
              },
              icon: const Icon(Icons.bookmark), //Watch list icon
            ),
            //When Home icon is pressed,it directs you to the Home Page
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Homepage()));
              },
              icon: const Icon(Icons.home), //Homepage icon
            ),
            //When watched List icon is pressed,it directs you to the Watched List Page
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WatchedListPage()));
              },
              icon: const Icon(Icons.toc_outlined), //Watched list icon
            ),
          ],
        ),
      ),
    );
  }
}
