import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/usecases/search_movies.dart';
import 'package:rxdart/rxdart.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies _searchMovies;
  SearchMovieBloc(this._searchMovies) : super(SearchMovieEmpty()) {
    on<OnQueryChanged>(
      (event, emit) async {
        emit(SearchMovieLoading());

        final result = await _searchMovies.execute(event.query);

        result.fold(
          (failure) {
            emit(SearchMovieError(failure.message));
          },
          (data) {
            if (data.isEmpty) {
              emit(SearchMovieEmpty());
            } else {
              emit(SearchMovieHasData(data));
            }
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
