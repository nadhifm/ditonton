part of 'recommendation_tv_bloc.dart';

abstract class TvRecommendationEvent extends Equatable {
  const TvRecommendationEvent();

  @override
  List<Object?> get props => [];
}

class FetchTvRecommendations extends TvRecommendationEvent {
  final int id;

  const FetchTvRecommendations(this.id);

  @override
  List<Object?> get props => [id];
}
