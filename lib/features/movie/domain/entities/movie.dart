import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'release_date': releaseDate,
      'poster_path': posterPath,
    };
  }
}
