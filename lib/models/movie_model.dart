class MovieModel {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  MovieModel({
    this.adult = false,
    this.backdropPath = "",
    this.id = -1,
    this.originalLanguage = "",
    this.originalTitle = "",
    this.overview = "",
    this.popularity = 0.0,
    this.posterPath = "",
    this.releaseDate = "",
    this.title = "",
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
    required this.genreIds,
  });
  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
        adult: jsonData["adult"] ?? false,
        backdropPath: jsonData["backdrop_path"] ?? "",
        id: jsonData["id"] ?? -1,
        originalLanguage: jsonData["original_language"] ?? "",
        originalTitle: jsonData["original_title"] ?? "",
        overview: jsonData["overview"] ?? "",
        popularity: jsonData["popularity"] ?? 0.0,
        posterPath: jsonData["poster_path"] ?? "",
        releaseDate: jsonData["adult"] ?? "",
        title: jsonData["title"] ?? "",
        video: jsonData["video"] ?? false,
        voteAverage: jsonData["vote_average"] ?? 0.0,
        voteCount: jsonData["vote_count"] ?? 0,
        genreIds: jsonData["genre_ids"] ?? []);
  }
}
