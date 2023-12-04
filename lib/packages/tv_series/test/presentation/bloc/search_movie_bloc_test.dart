import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/presentation/bloc/search_tv/search_tv_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvBloc searchTvBloc;
  late MockSearchTv mockSearchTv;

  setUp(() {
    mockSearchTv = MockSearchTv();
    searchTvBloc = SearchTvBloc(mockSearchTv);
  });

  test('initial state should be empty', () {
    expect(searchTvBloc.state, SearchTvEmpty());
  });

  blocTest<SearchTvBloc, SearchTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTv.execute('spiderman'))
          .thenAnswer((_) async => Right(testTvList));
      return searchTvBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged('spiderman')),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTvLoading(),
      SearchTvHasData(testTvList),
    ],
    verify: (bloc) => verify(mockSearchTv.execute('spiderman')),
  );

  blocTest<SearchTvBloc, SearchTvState>(
    'Should emit [Loading, Empty] when data is empty',
    build: () {
      when(mockSearchTv.execute('spiderman'))
          .thenAnswer((_) async => const Right([]));
      return searchTvBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged('spiderman')),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTvLoading(),
      SearchTvEmpty(),
    ],
    verify: (bloc) => verify(mockSearchTv.execute('spiderman')),
  );

  blocTest<SearchTvBloc, SearchTvState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockSearchTv.execute('spiderman'))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchTvBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChanged('spiderman')),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTvLoading(),
      const SearchTvError('Server Failure'),
    ],
    verify: (bloc) => verify(mockSearchTv.execute('spiderman')),
  );
}
