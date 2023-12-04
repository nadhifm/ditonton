part of 'watchlist_movie_bloc.dart';

abstract class WatchlistMovieState extends Equatable {
  const WatchlistMovieState();

  @override
  List<Object> get props => [];
}

class WatchlistMovieInitial extends WatchlistMovieState {}

class WatchlistMovieEmpty extends WatchlistMovieState {}

class WatchlistMovieLoading extends WatchlistMovieState {}

class WatchlistMovieStatus extends WatchlistMovieState {
  final bool isAddedToWatchlist;

  const WatchlistMovieStatus(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}

class WatchlistMovieMessage extends WatchlistMovieState {
  final String message;

  const WatchlistMovieMessage(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistMovieError extends WatchlistMovieState {
  final String message;

  const WatchlistMovieError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchListMovieHasData extends WatchlistMovieState {
  final List<Movie> movies;

  const WatchListMovieHasData(this.movies);

  @override
  List<Object> get props => [movies];
}
