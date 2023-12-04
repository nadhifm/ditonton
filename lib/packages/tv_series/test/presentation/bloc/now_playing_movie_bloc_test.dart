import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/presentation/bloc/on_the_air_tv/on_the_air_tv_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late OnTheAirTvBloc nowPlayingTvBloc;
  late MockGetOnTheAirTv mockGetOnTheAirTv;

  setUp(() {
    mockGetOnTheAirTv = MockGetOnTheAirTv();
    nowPlayingTvBloc = OnTheAirTvBloc(mockGetOnTheAirTv);
  });

  test('initial state should be empty', () {
    expect(nowPlayingTvBloc.state, OnTheAirTvEmpty());
  });

  blocTest<OnTheAirTvBloc, OnTheAirTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetOnTheAirTv.execute())
          .thenAnswer((_) async => Right(testTvList));
      return nowPlayingTvBloc;
    },
    act: (bloc) => bloc.add(FetchOnTheAirTv()),
    expect: () => [
      OnTheAirTvLoading(),
      OnTheAirTvHasData(testTvList),
    ],
    verify: (bloc) => verify(mockGetOnTheAirTv.execute()),
  );

  blocTest<OnTheAirTvBloc, OnTheAirTvState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockGetOnTheAirTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return nowPlayingTvBloc;
    },
    act: (bloc) => bloc.add(FetchOnTheAirTv()),
    expect: () => [
      OnTheAirTvLoading(),
      const OnTheAirTvError('Server Failure'),
    ],
    verify: (bloc) => verify(mockGetOnTheAirTv.execute()),
  );
}
