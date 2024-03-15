import 'package:flutter/material.dart';
import 'package:flutter_application_1/Functions/movie_list.dart';
import 'package:flutter_application_1/Screens/watch_list.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/back_button.dart';
import 'watched_list.dart';

//The movie details of each movie will be displayed
class Details extends StatelessWidget {
  const Details({super.key, required this.movie});

  final MovieLists movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackArrowButton(),
            backgroundColor: Color.fromARGB(255, 10, 4, 28),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Displays the overview of the movie
                  Text(
                    'Overview',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movie.overview,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              //Displays the release date of the movie
                              Text(
                                'Release date: ',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                movie.releaseDate,
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                      child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              //Displays the ratings of the movie
                              Text(
                                'Ratings: ',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                '${movie.voteAverage.toStringAsFixed(1)}/10',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))
                    ],
                  )),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        //The "Add to Watch List" button will be displayed
                        child: ElevatedButton(
                          onPressed: () {
                            WatchList.addToWatchList(
                                movie); //Add to WatchList function is called
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            textStyle: TextStyle(
                              fontSize: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text('+ Add to Watch List'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        //The "Add to Watched List" button will be displayed
                        child: ElevatedButton(
                          onPressed: () {
                            WatchedList.addToWatchedList(
                                movie); //Add to WatchedList function is called
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            textStyle: TextStyle(
                              fontSize: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text('+ Add to Watched List'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
