import 'package:flutter_application_1/Functions/movie_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

//Created a WatchedList class that manages a list of movies stored in the device's shared preferences.
class WatchedList {
  static const _watchedListKey =
      'watchedList'; //This will be used as the key to store and retrieve the watched list from shared preferences.

  static Future<List<MovieLists>> getWatchedList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? movieStrings = prefs.getStringList(_watchedListKey);
    if (movieStrings == null) {
      return [];
    }
    return movieStrings.map((jsonString) {
      Map<String, dynamic> json = jsonDecode(jsonString);
      return MovieLists.fromJson(json);
    }).toList();
  }

  //This method is used to add a movie to the watched list in shared preferences.
  static Future<void> addToWatchedList(MovieLists movie) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> watchedList = (await getWatchedList())
        .map((movie) => jsonEncode(movie.toJson()))
        .toList();
    watchedList.add(jsonEncode(movie.toJson()));
    await prefs.setStringList(_watchedListKey, watchedList);
  }
}
