import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constants.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/presentation/bloc/now_playing_movie/now_playing_movie_bloc.dart';
import 'package:movie/presentation/bloc/popular_movie/popular_movie_bloc.dart';
import 'package:movie/presentation/bloc/top_rated_movie/top_rated_movie_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NowPlayingMovieBloc>().add(FetchNowPlayingMovies());
      context.read<PopularMovieBloc>().add(FetchPopularMovies());
      context.read<TopRatedMovieBloc>().add(FetchTopRatedMovies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now Playing',
              style: kHeading6,
            ),
            BlocBuilder<NowPlayingMovieBloc, NowPlayingMovieState>(
                builder: (context, state) {
              if (state is NowPlayingMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NowPlayingMovieHasData) {
                return MovieList(
                  pageStorageKey: "now_playing_movie",
                  movies: state.movies,
                );
              } else if (state is NowPlayingMovieError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Failed'));
              }
            }),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(context, popularMovieRoute),
            ),
            BlocBuilder<PopularMovieBloc, PopularMovieState>(
                builder: (context, state) {
              if (state is PopularMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PopularMovieHasData) {
                return MovieList(
                  pageStorageKey: "popular_movie",
                  movies: state.movies,
                );
              } else if (state is PopularMovieError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Failed'));
              }
            }),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () => Navigator.pushNamed(context, topRatedMovieRoute),
            ),
            BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
                builder: (context, state) {
              if (state is TopRatedMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TopRatedMovieHasData) {
                return MovieList(
                  pageStorageKey: "top_rated_movie",
                  movies: state.movies,
                );
              } else if (state is TopRatedMovieError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('Failed'));
              }
            }),
          ],
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final String pageStorageKey;
  final List<Movie> movies;

  const MovieList({
    super.key,
    required this.pageStorageKey,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        key: PageStorageKey<String>(pageStorageKey),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  detailRoute,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
