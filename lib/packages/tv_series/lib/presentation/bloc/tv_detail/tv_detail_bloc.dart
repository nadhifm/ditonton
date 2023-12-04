import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  final GetTvDetail _getTvDetail;
  TvDetailBloc(this._getTvDetail) : super(TvDetailEmpty()) {
    on<FetchTvDetail>((event, emit) async {
      emit(TvDetailLoading());

      final result = await _getTvDetail.execute(event.id);

      result.fold(
        (failure) {
          emit(TvDetailError(failure.message));
        },
        (data) {
          emit(TvDetailHasData(data));
        },
      );
    });
  }
}
