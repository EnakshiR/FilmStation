import 'package:flutter/material.dart';
import 'package:flutter_application_1/Functions/movie_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../API/api_key_url.dart';
import 'details_page_for_movies.dart';
import 'search_bar.dart';

class SearchedDetails extends StatefulWidget {
  final String searchQuery;

  const SearchedDetails({super.key, required this.searchQuery});

  @override
  State<SearchedDetails> createState() => _SearchedDetailsScreenState();
}

class _SearchedDetailsScreenState extends State<SearchedDetails> {
  List<Map<String, dynamic>> results = [];
  final TextEditingController searchItem = TextEditingController();

  Future<void> searchInfo(String value) async {
    var searchStatus = await http.get(Uri.parse(MyApiKeys.searchBarUrl(value)));
    print("Searching for: $value");

    if (searchStatus.statusCode == 200) {
      var data = jsonDecode(searchStatus.body);
      var checkJson = data['results'];

      for (var i = 0; i < checkJson.length; i++) {
        //only add value if all are present
        if (checkJson[i]['poster_path'] != null &&
            checkJson[i]['popularity'] != null &&
            checkJson[i]['overview'] != null) {
          print("this is item: $i");

          results.add({
            'title': checkJson[i]['title'],
            'poster_path': checkJson[i]['poster_path'],
            'original_title': checkJson[i]['original_title'],
            'vote_average': checkJson[i]['vote_average'],
            'backdrop_path': checkJson[i]['backdrop_path'],
            'release_date': checkJson[i]['release_date'],
            'popularity': checkJson[i]['popularity'],
            'overview': checkJson[i]['overview'],
          });
          if (results.length > 20) {
            results.removeRange(20, results.length);
          }
        } else {
          print('Null found');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    searchItem.text = widget.searchQuery;
    searchInfo(widget.searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchBarFunction()),
      body: FutureBuilder(
        future: searchInfo(searchItem.text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                //Search Results
                return Card(
                  elevation: 4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Details(movie: createMovieLists(results, index)),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Poster
                          Container(
                            width: 80,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500/${results[index]['poster_path']}',
                                ),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Title
                                Text(
                                  results[index]['title'],
                                  style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                //Overview
                                Text(
                                  'Overview: ${results[index]['overview']}',
                                  style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                //Popularity
                                Text(
                                  'Popularity: ${results[index]['popularity']}',
                                  style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  MovieLists createMovieLists(List<Map<String, dynamic>> results, int index) {
    return MovieLists(
        title: results[index]['title'],
        backDropPath: results[index]['backdrop_path'],
        originalTitle: results[index]['original_title'],
        overview: results[index]['overview'],
        posterPath: results[index]['poster_path'],
        releaseDate: results[index]['release_date'],
        popularity: results[index]['popularity'],
        voteAverage: results[index]['vote_average']);
  }
}
