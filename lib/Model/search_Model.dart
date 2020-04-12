// To parse this JSON data, do
//
//     final searchedItems = searchedItemsFromJson(jsonString);

import 'dart:convert';

SearchedItems searchedItemsFromJson(String str) => SearchedItems.fromJson(json.decode(str));

String searchedItemsToJson(SearchedItems data) => json.encode(data.toJson());

class SearchedItems {
  int page;
  int totalResults;
  int totalPages;
  List<Result> results;

  SearchedItems({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory SearchedItems.fromJson(Map<String, dynamic> json) => SearchedItems(
    page: json["page"],
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total_results": totalResults,
    "total_pages": totalPages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Result({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    popularity: json["popularity"].toDouble(),
    voteCount: json["vote_count"],
    video: json["video"],
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    id: json["id"],
    adult: json["adult"],
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    title: json["title"],
    voteAverage: json["vote_average"].toDouble(),
    overview: json["overview"],
    releaseDate: json["release_date"] == null ? null : json["release_date"],
  );

  Map<String, dynamic> toJson() => {
    "popularity": popularity,
    "vote_count": voteCount,
    "video": video,
    "poster_path": posterPath == null ? null : posterPath,
    "id": id,
    "adult": adult,
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "title": title,
    "vote_average": voteAverage,
    "overview": overview,
    "release_date": releaseDate == null ? null : releaseDate,
  };
}
