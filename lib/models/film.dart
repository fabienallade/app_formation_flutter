class Film {
  String? id;
  String? title;
  String? originalTitle;
  String? description;
  String? releaseDate;
  String? movieBanner;

  Film(
      {this.id,
      this.title,
      this.originalTitle,
      this.description,
      this.releaseDate,
      this.movieBanner});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json["id"],
      title: json["title"],
      originalTitle: json["original_title"],
      description: json["description"],
      releaseDate: json["release_date"],
      movieBanner: json["movie_banner"],
    );
  }
}
