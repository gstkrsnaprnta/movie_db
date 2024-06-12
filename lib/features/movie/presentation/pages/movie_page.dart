import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_db/core/resources/data_state.dart';
import 'package:movie_db/features/movie/domain/entities/movie.dart';
import 'package:movie_db/features/movie/presentation/providers/providers.dart';

class MoviePage extends ConsumerWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getMovie = ref.watch(getMovieProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: FutureBuilder<DataState<List<Movie>>>(
        future: getMovie.call(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError ||
              snapshot.data?.status == DataStateStatus.error) {
            return Center(
              child: Text(
                  'Failed to fetch movies: ${snapshot.data?.error ?? 'Unknown error'}'),
            );
          } else if (snapshot.data?.status == DataStateStatus.success) {
            final movies = snapshot.data!.data!;
            // Debug print untuk memastikan data yang diterima benar
            for (var movie in movies) {
              print('Movie title: ${movie.title}');
              print('Movie overview: ${movie.overview}');
              print('Movie posterPath: ${movie.posterPath}');
            }
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons
                          .error); // Placeholder jika gambar tidak ditemukan
                    },
                  ),
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
                );
              },
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
