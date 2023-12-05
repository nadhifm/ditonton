part of 'watchlist_tv_bloc.dart';

abstract class WatchlistTvState extends Equatable {
  const WatchlistTvState();

  @override
  List<Object> get props => [];
}

class WatchlistTvInitial extends WatchlistTvState {}

class WatchlistTvEmpty extends WatchlistTvState {}

class WatchlistTvLoading extends WatchlistTvState {}

class WatchlistTvStatus extends WatchlistTvState {
  final bool isAddedToWatchlist;

  const WatchlistTvStatus(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}

class WatchlistTvMessage extends WatchlistTvState {
  final String message;

  const WatchlistTvMessage(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistTvError extends WatchlistTvState {
  final String message;

  const WatchlistTvError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchListTvHasData extends WatchlistTvState {
  final List<Tv> tv;

  const WatchListTvHasData(this.tv);

  @override
  List<Object> get props => [tv];
}
