part of 'on_the_air_tv_bloc.dart';

abstract class OnTheAirTvState extends Equatable {
  const OnTheAirTvState();

  @override
  List<Object> get props => [];
}

class OnTheAirTvEmpty extends OnTheAirTvState {}

class OnTheAirTvLoading extends OnTheAirTvState {}

class OnTheAirTvError extends OnTheAirTvState {
  final String message;

  const OnTheAirTvError(this.message);

  @override
  List<Object> get props => [message];
}

class OnTheAirTvHasData extends OnTheAirTvState {
  final List<Tv> tv;

  const OnTheAirTvHasData(this.tv);

  @override
  List<Object> get props => [tv];
}
