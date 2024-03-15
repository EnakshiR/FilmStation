//The class has variables representing various attributes of a movie.
class MovieLists {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double popularity;
  double voteAverage;

//This constructor initializes an object of the MovieLists class with the provided attributes.
  MovieLists({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
  });
  //Factory constructor is used to instantiate a MovieLists object from a JSON map.
  factory MovieLists.fromJson(Map<String, dynamic> json) {
    return MovieLists(
        title: json["title"],
        backDropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        popularity: json["popularity"],
        voteAverage: json["vote_average"]);
  }
  //This method converts a MovieLists object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "backdrop_path": backDropPath,
      "original_title": originalTitle,
      "overview": overview,
      "poster_path": posterPath,
      "release_date": releaseDate,
      "popularity": popularity,
      "vote_average": voteAverage,
    };
  }
}
