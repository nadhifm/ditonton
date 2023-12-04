part of 'watchlist_tv_bloc.dart';

abstract class WatchlistTvEvent extends Equatable {
  const WatchlistTvEvent();

  @override
  List<Object> get props => [];
}

class LoadWatchlistStatus extends WatchlistTvEvent {
  final int id;

  const LoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}

class AddWatchlist extends WatchlistTvEvent {
  final TvDetail tvDetail;

  const AddWatchlist(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}

class RemoveFromWatchlist extends WatchlistTvEvent {
  final TvDetail tvDetail;

  const RemoveFromWatchlist(this.tvDetail);

  @override
  List<Object> get props => [tvDetail];
}

class FetchWatchlistTv extends WatchlistTvEvent {}