import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/presentation/bloc/tv_detail/tv_detail_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvDetailBloc movieDetailBloc;
  late MockGetTvDetail mockGetTvDetail;

  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    movieDetailBloc = TvDetailBloc(mockGetTvDetail);
  });

  test('initial state should be empty', () {
    expect(movieDetailBloc.state, TvDetailEmpty());
  });

  blocTest<TvDetailBloc, TvDetailState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTvDetail.execute(1))
          .thenAnswer((_) async => const Right(testTvDetail));
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(const FetchTvDetail(1)),
    expect: () => [
      TvDetailLoading(),
      const TvDetailHasData(testTvDetail),
    ],
    verify: (bloc) => verify(mockGetTvDetail.execute(1)),
  );

  blocTest<TvDetailBloc, TvDetailState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockGetTvDetail.execute(1))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(const FetchTvDetail(1)),
    expect: () => [
      TvDetailLoading(),
      const TvDetailError('Server Failure'),
    ],
    verify: (bloc) => verify(mockGetTvDetail.execute(1)),
  );
}
