import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/movie/domain/entities/movie.dart';
import 'package:movie_db/features/movie/domain/repository/movie_repository.dart';

class GetMovie {
  final MovieRepository repository;

  GetMovie(this.repository);

  Future<DataState<List<Movie>>> call() {
    return repository.getMovie();
  }
}
