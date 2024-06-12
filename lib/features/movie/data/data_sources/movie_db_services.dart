import 'package:dio/dio.dart';
import 'package:movie_db/features/movie/data/model/movie_model.dart';

class MovieDbService {
  final Dio dio;

  MovieDbService(this.dio);

  Future<List<MovieModel>> getMovies() async {
    final response = await dio.get(
        'https://api.themoviedb.org/2/movie?api_key=71d3c122032ae2b3eeaa49a22e16656a');
    return (response.data['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();
  }
}
