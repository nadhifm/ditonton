part of 'recommendation_movie_bloc.dart';

abstract class MovieRecommendationEvent extends Equatable {
  const MovieRecommendationEvent();

  @override
  List<Object?> get props => [];
}

class FetchMovieRecommendations extends MovieRecommendationEvent {
  final int id;

  const FetchMovieRecommendations(this.id);

  @override
  List<Object?> get props => [id];
}
