import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/presentation/bloc/popular_tv/popular_tv_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late PopularTvBloc popularTvBloc;
  late MockGetPopularTv mockGetPopularTv;

  setUp(() {
    mockGetPopularTv = MockGetPopularTv();
    popularTvBloc = PopularTvBloc(mockGetPopularTv);
  });

  test('initial state should be empty', () {
    expect(popularTvBloc.state, PopularTvEmpty());
  });

  blocTest<PopularTvBloc, PopularTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetPopularTv.execute())
          .thenAnswer((_) async => Right(testTvList));
      return popularTvBloc;
    },
    act: (bloc) => bloc.add(FetchPopularTv()),
    expect: () => [
      PopularTvLoading(),
      PopularTvHasData(testTvList),
    ],
    verify: (bloc) => verify(mockGetPopularTv.execute()),
  );

  blocTest<PopularTvBloc, PopularTvState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockGetPopularTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return popularTvBloc;
    },
    act: (bloc) => bloc.add(FetchPopularTv()),
    expect: () => [
      PopularTvLoading(),
      const PopularTvError('Server Failure'),
    ],
    verify: (bloc) => verify(mockGetPopularTv.execute()),
  );
}
