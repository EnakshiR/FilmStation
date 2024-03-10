class TVLists {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String airingDate;
  double popularity;
  double voteAverage;

//Making a constructor
  TVLists({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.airingDate,
    required this.popularity,
    required this.voteAverage,
  });

  factory TVLists.fromJson(Map<String, dynamic> json) {
    return TVLists(
        title: json["title"],
        backDropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        airingDate: json["first_air_date"],
        popularity: json["popularity"],
        voteAverage: json["vote_average"]);
  }
}
