// import 'package:dio/dio.dart';
// import 'package:movie_db/core/resources/data_state.dart';
// import 'package:movie_db/features/movie/data/data_sources/movie_db_services.dart';
// import 'package:movie_db/features/movie/data/repository/movie_repository._impl.dart';

// void main() async {
//   final dio = Dio();
//   final movieDbService = MovieDbService(dio);
//   final movieRepository = MovieRepositoryImpl(movieDbService);

//   final result = await movieRepository.getMovie();

//   if (result.status == DataStateStatus.success) {
//     print('Movies fetched successfully:');
//     result.data?.forEach((movie) {
//       print('Title: ${movie.title}, Release Date: ${movie.releaseDate} Overiview: ${movie.overview}', );
//     });
//   } else {
//     print('Failed to fetch movies: ${result.message}');
//   }
// }
