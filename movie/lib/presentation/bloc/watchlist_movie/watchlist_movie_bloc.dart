import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/entities/movie_detail.dart';
import 'package:movie/domain/usecases/get_watchlist_movies.dart';
import 'package:movie/domain/usecases/get_watchlist_status.dart';
import 'package:movie/domain/usecases/remove_watchlist.dart';
import 'package:movie/domain/usecases/save_watchlist.dart';

part 'watchlist_movie_event.dart';
part 'watchlist_movie_state.dart';

class WatchlistMovieBloc
    extends Bloc<WatchlistMovieEvent, WatchlistMovieState> {
  final GetWatchListStatus _getWatchListStatus;
  final SaveWatchlist _saveWatchlist;
  final RemoveWatchlist _removeWatchlist;
  final GetWatchlistMovies _getWatchlistMovies;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  WatchlistMovieBloc(
    this._getWatchListStatus,
    this._saveWatchlist,
    this._removeWatchlist,
    this._getWatchlistMovies,
  ) : super(WatchlistMovieInitial()) {
    on<LoadWatchlistStatus>((event, emit) async {
      final result = await _getWatchListStatus.execute(event.id);

      emit(WatchlistMovieStatus(result));
    });

    on<AddWatchlist>((event, emit) async {
      final result = await _saveWatchlist.execute(event.movieDetail);

      result.fold(
        (failure) {
          emit(WatchlistMovieMessage(failure.message));
        },
        (successMessage) {
          emit(WatchlistMovieMessage(successMessage));
        },
      );
    });

    on<RemoveFromWatchlist>((event, emit) async {
      final result = await _removeWatchlist.execute(event.movieDetail);

      result.fold(
        (failure) {
          emit(WatchlistMovieMessage(failure.message));
        },
        (successMessage) {
          emit(WatchlistMovieMessage(successMessage));
        },
      );
    });

    on<FetchWatchlistMovies>((event, emit) async {
      emit(WatchlistMovieLoading());

      final result = await _getWatchlistMovies.execute();

      result.fold(
        (failure) {
          emit(WatchlistMovieError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(WatchlistMovieEmpty());
          } else {
            emit(WatchListMovieHasData(data));
          }
        },
      );
    });
  }
}
