//The class has variables representing various attributes of a tv show.
class TVLists {
  String name;
  String originalName;
  String overview;
  String posterPath;
  String airingDate;
  double popularity;
  double voteAverage;

//This constructor initializes an object of the TVLists class with the provided attributes.
  TVLists({
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.airingDate,
    required this.popularity,
    required this.voteAverage,
  });
  //Factory constructor is used to instantiate a TVLists object from a JSON map.
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
  //This method converts a TVLists object to a JSON map
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
