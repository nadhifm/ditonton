import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';

part 'recommendation_movie_event.dart';
part 'recommendation_movie_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final GetMovieRecommendations _getMovieRecommendations;
  MovieRecommendationBloc(this._getMovieRecommendations)
      : super(MovieRecommendationEmpty()) {
    on<FetchMovieRecommendations>((event, emit) async {
      emit(MovieRecommendationLoading());

      final result = await _getMovieRecommendations.execute(event.id);

      result.fold(
        (failure) {
          emit(MovieRecommendationError(failure.message));
        },
        (data) {
          emit(MovieRecommendationHasData(data));
        },
      );
    });
  }
}
