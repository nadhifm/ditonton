import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tv.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tv_status.dart';
import 'package:tv_series/domain/usecases/remove_watchlist_tv.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv.dart';

part 'watchlist_tv_event.dart';
part 'watchlist_tv_state.dart';

class WatchlistTvBloc
    extends Bloc<WatchlistTvEvent, WatchlistTvState> {
  final GetWatchListTvStatus _getWatchListTvStatus;
  final SaveWatchlistTv _saveWatchlist;
  final RemoveWatchlistTv _removeWatchlist;
  final GetWatchlistTv _getWatchlistTv;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  WatchlistTvBloc(
    this._getWatchListTvStatus,
    this._saveWatchlist,
    this._removeWatchlist,
    this._getWatchlistTv,
  ) : super(WatchlistTvInitial()) {
    on<LoadWatchlistStatus>((event, emit) async {
      final result = await _getWatchListTvStatus.execute(event.id);

      emit(WatchlistTvStatus(result));
    });

    on<AddWatchlist>((event, emit) async {
      final result = await _saveWatchlist.execute(event.tvDetail);

      result.fold(
        (failure) {
          emit(WatchlistTvMessage(failure.message));
        },
        (successMessage) {
          emit(WatchlistTvMessage(successMessage));
        },
      );
    });

    on<RemoveFromWatchlist>((event, emit) async {
      final result = await _removeWatchlist.execute(event.tvDetail);

      result.fold(
        (failure) {
          emit(WatchlistTvMessage(failure.message));
        },
        (successMessage) {
          emit(WatchlistTvMessage(successMessage));
        },
      );
    });

    on<FetchWatchlistTv>((event, emit) async {
      emit(WatchlistTvLoading());

      final result = await _getWatchlistTv.execute();

      result.fold(
        (failure) {
          emit(WatchlistTvError(failure.message));
        },
        (data) {
          if (data.isEmpty) {
            emit(WatchlistTvEmpty());
          } else {
            emit(WatchListTvHasData(data));
          }
        },
      );
    });
  }
}
