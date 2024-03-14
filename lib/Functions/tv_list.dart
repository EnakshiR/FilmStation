class TVLists {
  String name;
  String originalName;
  String overview;
  String posterPath;
  String airingDate;
  double popularity;
  double voteAverage;

//Making a constructor
  TVLists({
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.airingDate,
    required this.popularity,
    required this.voteAverage,
  });

  factory TVLists.fromJson(Map<String, dynamic> json) {
    return TVLists(
        name: json["name"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        airingDate: json["first_air_date"],
        popularity: json["popularity"],
        voteAverage: json["vote_average"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "original_name": originalName,
      "overview": overview,
      "poster_path": posterPath,
      "first_air_date": airingDate,
      "popularity": popularity,
      "vote_average": voteAverage,
    };
  }
}
