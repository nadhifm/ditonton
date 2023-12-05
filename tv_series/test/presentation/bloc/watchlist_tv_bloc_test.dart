import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/presentation/bloc/watchlist_tv/watchlist_tv_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistTvBloc watchlistTvBloc;
  late MockGetWatchListTvStatus mockGetWatchListTvStatus;
  late MockSaveWatchlistTv mockSaveWatchlistTv;
  late MockRemoveWatchlistTv mockRemoveWatchlistTv;
  late MockGetWatchlistTv mockGetWatchlistTv;

  setUp(() {
    mockGetWatchListTvStatus = MockGetWatchListTvStatus();
    mockSaveWatchlistTv = MockSaveWatchlistTv();
    mockRemoveWatchlistTv = MockRemoveWatchlistTv();
    mockGetWatchlistTv = MockGetWatchlistTv();
    watchlistTvBloc = WatchlistTvBloc(
      mockGetWatchListTvStatus,
      mockSaveWatchlistTv,
      mockRemoveWatchlistTv,
      mockGetWatchlistTv,
    );
  });

  test('initial state should be initial', () {
    expect(watchlistTvBloc.state, WatchlistTvInitial());
  });

  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Status] when load status watchlist',
    build: () {
      when(mockGetWatchListTvStatus.execute(1)).thenAnswer((_) async => true);
      return watchlistTvBloc;
    },
    act: (bloc) => bloc.add(const LoadWatchlistStatus(1)),
    expect: () => [
      const WatchlistTvStatus(true),
    ],
    verify: (bloc) => verify(mockGetWatchListTvStatus.execute(1)),
  );

  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Message] when save watchlist tv successful',
    build: () {
      when(mockSaveWatchlistTv.execute(testTvDetail))
          .thenAnswer((_) async => const Right('Success'));
      return watchlistTvBloc;
    },
    act: (bloc) => bloc.add(const AddWatchlist(testTvDetail)),
    expect: () => [
      const WatchlistTvMessage('Success'),
    ],
    verify: (bloc) => verify(mockSaveWatchlistTv.execute(testTvDetail)),
  );

  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Message] when save watchlist tv unsuccessful',
    build: () {
      when(mockSaveWatchlistTv.execute(testTvDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Database Failure')));
      return watchlistTvBloc;
    },
    act: (bloc) => bloc.add(const AddWatchlist(testTvDetail)),
    expect: () => [
      const WatchlistTvMessage('Database Failure'),
    ],
    verify: (bloc) => verify(mockSaveWatchlistTv.execute(testTvDetail)),
  );

  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Message] when remove watchlist tv successful',
    build: () {
      when(mockRemoveWatchlistTv.execute(testTvDetail))
          .thenAnswer((_) async => const Right('Success'));
      return watchlistTvBloc;
    },
    act: (bloc) => bloc.add(const RemoveFromWatchlist(testTvDetail)),
    expect: () => [
      const WatchlistTvMessage('Success'),
    ],
    verify: (bloc) => verify(mockRemoveWatchlistTv.execute(testTvDetail)),
  );

  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Message] when remove watchlist tv unsuccessful',
    build: () {
      when(mockRemoveWatchlistTv.execute(testTvDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Database Failure')));
      return watchlistTvBloc;
    },
    act: (bloc) => bloc.add(const RemoveFromWatchlist(testTvDetail)),
    expect: () => [
      const WatchlistTvMessage('Database Failure'),
    ],
    verify: (bloc) => verify(mockRemoveWatchlistTv.execute(testTvDetail)),
  );

  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistTv.execute())
          .thenAnswer((_) async => Right(testTvList));
      return watchlistTvBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistTv()),
    expect: () => [
      WatchlistTvLoading(),
      WatchListTvHasData(testTvList),
    ],
    verify: (bloc) => verify(mockGetWatchlistTv.execute()),
  );

  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistTv.execute())
          .thenAnswer((_) async => const Right([]));
      return watchlistTvBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistTv()),
    expect: () => [
      WatchlistTvLoading(),
      WatchlistTvEmpty(),
    ],
    verify: (bloc) => verify(mockGetWatchlistTv.execute()),
  );

  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockGetWatchlistTv.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return watchlistTvBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistTv()),
    expect: () => [
      WatchlistTvLoading(),
      const WatchlistTvError('Server Failure'),
    ],
    verify: (bloc) => verify(mockGetWatchlistTv.execute()),
  );
}
