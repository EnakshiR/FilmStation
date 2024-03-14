import 'package:flutter_application_1/Functions/movie_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WatchList {
  static const _watchListKey = 'watchList';

  static Future<List<MovieLists>> getWatchList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? movieStrings = prefs.getStringList(_watchListKey);
    if (movieStrings == null) {
      return [];
    }
    return movieStrings.map((jsonString) {
      Map<String, dynamic> json = jsonDecode(jsonString);
      return MovieLists.fromJson(json);
    }).toList();
  }

  static Future<void> addToWatchList(MovieLists movie) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> watchList = (await getWatchList())
        .map((movie) => jsonEncode(movie.toJson()))
        .toList();
    watchList.add(jsonEncode(movie.toJson()));
    await prefs.setStringList(_watchListKey, watchList);
  }
}
