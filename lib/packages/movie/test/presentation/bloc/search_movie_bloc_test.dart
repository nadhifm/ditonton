import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/search_movie/search_movie_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchMovieBloc searchMovieBloc;
  late MockSearchMovies mockSearchMovies;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    searchMovieBloc = SearchMovieBloc(mockSearchMovies);
  });

  test('initial state should be empty', () {
    expect(searchMovieBloc.state, SearchMovieEmpty());
  });

  blocTest<SearchMovieBloc, SearchMovieState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchMovies.execute('spiderman'))
          .thenAnswer((_) async => Right(testMovieList));
      return searchMovieBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged('spiderman')),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchMovieLoading(),
      SearchMovieHasData(testMovieList),
    ],
    verify: (bloc) => verify(mockSearchMovies.execute('spiderman')),
  );

  blocTest<SearchMovieBloc, SearchMovieState>(
    'Should emit [Loading, Empty] when data is empty',
    build: () {
      when(mockSearchMovies.execute('spiderman'))
          .thenAnswer((_) async => const Right([]));
      return searchMovieBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged('spiderman')),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchMovieLoading(),
      SearchMovieEmpty(),
    ],
    verify: (bloc) => verify(mockSearchMovies.execute('spiderman')),
  );

  blocTest<SearchMovieBloc, SearchMovieState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockSearchMovies.execute('spiderman'))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchMovieBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged('spiderman')),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchMovieLoading(),
      const SearchMovieError('Server Failure'),
    ],
    verify: (bloc) => verify(mockSearchMovies.execute('spiderman')),
  );
}
