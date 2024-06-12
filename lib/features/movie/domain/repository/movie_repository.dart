import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/movie/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<DataState<List<Movie>>> getMovie();
}
