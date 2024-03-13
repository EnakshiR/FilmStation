import 'dart:convert';

import 'package:flutter_application_1/Functions/movie_list.dart';
import 'package:flutter_application_1/Functions/tv_list.dart';
import 'package:http/http.dart' as http;

class MyApiKeys {
  static const _cinemaMoviesURL =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=cfe5b073340152cbfba63b6c9ef1f864';

  static const _tvShowsURL =
      'https://api.themoviedb.org/3/tv/airing_today?api_key=cfe5b073340152cbfba63b6c9ef1f864';

  static const _bestRatedMoviesURL =
      'https://api.themoviedb.org/3/discover/movie?api_key=cfe5b073340152cbfba63b6c9ef1f864&primary_release_year=2024&sort_by=popularity.desc';

  static const _highestGrossingURL =
      'https://api.themoviedb.org/3/discover/movie?api_key=cfe5b073340152cbfba63b6c9ef1f864&sort_by=revenue.desc';

  static const _childrenMoviesURL =
      'https://api.themoviedb.org/3/discover/movie?api_key=cfe5b073340152cbfba63b6c9ef1f864&with_original_language=en&certification_country=US&certification.lte=G&with_genres=16';

  static String searchBarUrl(String query) =>
      'https://api.themoviedb.org/3/search/movie?api_key=cfe5b073340152cbfba63b6c9ef1f864&query=$query&sort_by=popularity.desc';

  Future<List<MovieLists>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse(_cinemaMoviesURL));
    if (response.statusCode == 200) {
      final decodeJsonData = json.decode(response.body)['results'] as List;
      return decodeJsonData.map((movie) => MovieLists.fromJson(movie)).toList();
    } else {
      throw Exception('Error has occured');
    }
  }

  Future<List<TVLists>> getTVShows() async {
    final response = await http.get(Uri.parse(_tvShowsURL));
    if (response.statusCode == 200) {
      final decodeJsonData = json.decode(response.body)['results'] as List;
      return decodeJsonData.map((tvshow) => TVLists.fromJson(tvshow)).toList();
    } else {
      throw Exception('Error has occured');
    }
  }

  Future<List<MovieLists>> getBestMovies() async {
    final response = await http.get(Uri.parse(_bestRatedMoviesURL));
    if (response.statusCode == 200) {
      final decodeJsonData = json.decode(response.body)['results'] as List;
      return decodeJsonData.map((movie) => MovieLists.fromJson(movie)).toList();
    } else {
      throw Exception('Error has occured');
    }
  }

  Future<List<MovieLists>> getHighestGrossingMovies() async {
    final response = await http.get(Uri.parse(_highestGrossingURL));
    if (response.statusCode == 200) {
      final decodeJsonData = json.decode(response.body)['results'] as List;
      return decodeJsonData.map((movie) => MovieLists.fromJson(movie)).toList();
    } else {
      throw Exception('Error has occured');
    }
  }

  Future<List<MovieLists>> getChildrenMovies() async {
    final response = await http.get(Uri.parse(_childrenMoviesURL));
    if (response.statusCode == 200) {
      final decodeJsonData = json.decode(response.body)['results'] as List;
      return decodeJsonData.map((movie) => MovieLists.fromJson(movie)).toList();
    } else {
      throw Exception('Error has occured');
    }
  }

  Future<List<MovieLists>> getSearchMovies(String query) async {
    final response = await http.get(Uri.parse(searchBarUrl(query)));
    if (response.statusCode == 200) {
      final decodeJsonData = json.decode(response.body)['results'] as List;
      return decodeJsonData.map((movie) => MovieLists.fromJson(movie)).toList();
    } else {
      throw Exception('Error has occured');
    }
  }
}
