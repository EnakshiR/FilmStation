import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../API/api_key_url.dart';
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

  Future<void> SearchList(String value) async {
    var searchResponse =
        await http.get(Uri.parse(MyApiKeys.searchBarUrl(value)));
    print("Searching for: $value");

    if (searchResponse.statusCode == 200) {
      var tempdata = jsonDecode(searchResponse.body);
      var searchJson = tempdata['results'];

      for (var i = 0; i < searchJson.length; i++) {
        //only add value if all are present
        if (searchJson[i]['id'] != null &&
            (searchJson[i]['poster_path'] != null ||
                searchJson[i]['profile_path'] != null) &&
            searchJson[i]['media_type'] != null &&
            searchJson[i]['popularity'] != null &&
            (searchJson[i]['overview'] != null ||
                searchJson[i]['known_for_department'] != null)) {
          print("this is item: $i");

          if (searchJson[i]['media_type'] == 'movie') {
            results.add({
              'id': searchJson[i]['id'],
              'title': searchJson[i]['title'],
              'poster_path': searchJson[i]['poster_path'],
              'vote_average': searchJson[i]['vote_average'],
              'media_type': searchJson[i]['media_type'],
              'popularity': searchJson[i]['popularity'],
              'overview': searchJson[i]['overview'],
            });
          } else if (searchJson[i]['media_type'] == 'tv') {
            results.add({
              'id': searchJson[i]['id'],
              'title': searchJson[i]['name'],
              'poster_path': searchJson[i]['poster_path'],
              'vote_average': searchJson[i]['vote_average'],
              'media_type': searchJson[i]['media_type'],
              'popularity': searchJson[i]['popularity'],
              'overview': searchJson[i]['overview'],
            });
          } else if (searchJson[i]['media_type'] == 'person') {
            results.add({
              'id': searchJson[i]['id'],
              'title': searchJson[i]['name'],
              'poster_path': searchJson[i]['profile_path'],
              'media_type': searchJson[i]['media_type'],
              'popularity': searchJson[i]['popularity'],
              'overview': searchJson[i]['known_for_department'],
            });
          }
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
    SearchList(widget.searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchBarFunction()),
      body: FutureBuilder(
        future: SearchList(searchItem.text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                // Result items
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Movie Poster
                          Container(
                            width: 80,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${results[index]['poster_path']}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Movie Title
                                Text(
                                  results[index]['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                // Movie Overview
                                Text(
                                  'Overview: ${results[index]['overview']}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                // Movie Popularity
                                Text(
                                    'Popularity: ${results[index]['popularity']}'),
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
}
