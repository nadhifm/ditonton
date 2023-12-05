import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';

part 'recommendation_tv_event.dart';
part 'recommendation_tv_state.dart';

class TvRecommendationBloc
    extends Bloc<TvRecommendationEvent, TvRecommendationState> {
  final GetTvRecommendations _getTvRecommendations;
  TvRecommendationBloc(this._getTvRecommendations)
      : super(TvRecommendationEmpty()) {
    on<FetchTvRecommendations>((event, emit) async {
      emit(TvRecommendationLoading());

      final result = await _getTvRecommendations.execute(event.id);

      result.fold(
        (failure) {
          emit(TvRecommendationError(failure.message));
        },
        (data) {
          emit(TvRecommendationHasData(data));
        },
      );
    });
  }
}
