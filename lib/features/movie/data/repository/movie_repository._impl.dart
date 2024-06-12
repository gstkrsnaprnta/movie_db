import 'package:dio/dio.dart';
import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/movie/data/model/movie_model.dart';
import 'package:movie_db/features/movie/domain/entities/movie.dart';
import 'package:movie_db/features/movie/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio dio;

  MovieRepositoryImpl(this.dio);

  @override
  Future<DataState<List<Movie>>> getMovie() async {
    try {
      print('Fetching movies...');
      final response = await dio.get(
          'https://api.themoviedb.org/3/movie/popular?api_key=71d3c122032ae2b3eeaa49a22e16656a');
      print('Response received: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response data: ${response.data}');
        final List<Movie> movies = (response.data['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();
        print('Movies parsed successfully');
        return DataState.success(movies);
      } else {
        print('Failed to fetch movies: ${response.statusMessage}');
        return DataState.error(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } catch (e) {
      print('An error occurred: $e');
      return DataState.error('An error occurred: $e');
    }
  }
}
