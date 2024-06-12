import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:movie_db/features/movie/data/repository/movie_repository._impl.dart';
import 'package:movie_db/features/movie/domain/repository/movie_repository.dart';
import 'package:movie_db/features/movie/domain/usecases/get_movie_test.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return MovieRepositoryImpl(dio);
});

final getMovieProvider = Provider<GetMovie>(
  (ref) {
    final repository = ref.watch(movieRepositoryProvider);
    return GetMovie(repository);
  },
);
