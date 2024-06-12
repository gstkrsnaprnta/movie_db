import 'dart:convert';
import 'package:movie_db/features/movie/domain/entities/movie.dart';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

class MovieModel extends Movie {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final double? popularity;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.posterPath,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.popularity,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        releaseDate: json["release_date"] ?? '',
        posterPath: json["poster_path"] ?? '',
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        popularity: json["popularity"]?.toDouble(),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}
