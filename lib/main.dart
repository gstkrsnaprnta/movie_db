import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_db/features/movie/presentation/pages/movie_page.dart';
import 'package:movie_db/features/movie/presentation/providers/providers.dart';
import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/movie/domain/entities/movie.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MoviePage(),
    );
  }
}

// class MoviePage extends ConsumerWidget {
//   const MoviePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final getMovie = ref.watch(getMovieProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movie App'),
//       ),
//       body: FutureBuilder<DataState<List<Movie>>>(
//         future: getMovie.call(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError ||
//               snapshot.data?.status == DataStateStatus.error) {
//             return Center(
//                 child: Text(
//                     'Failed to fetch movies: ${snapshot.data?.error ?? 'Unknown error'}'));
//           } else if (snapshot.data?.status == DataStateStatus.success) {
//             final movies = snapshot.data!.data!;
//             return ListView.builder(
//               itemCount: movies.length,
//               itemBuilder: (context, index) {
//                 final movie = movies[index];
//                 return ListTile(
//                   leading: Image.network(
//                       'image.tmdb.org/t/p/w500${movie.posterPath}'),
//                   title: Text(movie.title),
//                   subtitle: Text(movie.overview),
//                 );
//               },
//             );
//           } else {
//             return const Center(child: Text('Unknown state'));
//           }
//         },
//       ),
//     );
//   }
// }
