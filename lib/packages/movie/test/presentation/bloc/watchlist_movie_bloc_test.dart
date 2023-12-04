import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/bloc/watchlist_movie/watchlist_movie_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistMovieBloc watchlistMovieBloc;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    watchlistMovieBloc = WatchlistMovieBloc(
      mockGetWatchListStatus,
      mockSaveWatchlist,
      mockRemoveWatchlist,
      mockGetWatchlistMovies,
    );
  });

  test('initial state should be initial', () {
    expect(watchlistMovieBloc.state, WatchlistMovieInitial());
  });

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Status] when load status watchlist',
    build: () {
      when(mockGetWatchListStatus.execute(1)).thenAnswer((_) async => true);
      return watchlistMovieBloc;
    },
    act: (bloc) => bloc.add(const LoadWatchlistStatus(1)),
    expect: () => [
      const WatchlistMovieStatus(true),
    ],
    verify: (bloc) => verify(mockGetWatchListStatus.execute(1)),
  );

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Message] when save watchlist movie successful',
    build: () {
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Success'));
      return watchlistMovieBloc;
    },
    act: (bloc) => bloc.add(const AddWatchlist(testMovieDetail)),
    expect: () => [
      const WatchlistMovieMessage('Success'),
    ],
    verify: (bloc) => verify(mockSaveWatchlist.execute(testMovieDetail)),
  );

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Message] when save watchlist movie unsuccessful',
    build: () {
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Database Failure')));
      return watchlistMovieBloc;
    },
    act: (bloc) => bloc.add(const AddWatchlist(testMovieDetail)),
    expect: () => [
      const WatchlistMovieMessage('Database Failure'),
    ],
    verify: (bloc) => verify(mockSaveWatchlist.execute(testMovieDetail)),
  );

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Message] when remove watchlist movie successful',
    build: () {
      when(mockRemoveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Success'));
      return watchlistMovieBloc;
    },
    act: (bloc) => bloc.add(const RemoveFromWatchlist(testMovieDetail)),
    expect: () => [
      const WatchlistMovieMessage('Success'),
    ],
    verify: (bloc) => verify(mockRemoveWatchlist.execute(testMovieDetail)),
  );

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Message] when remove watchlist movie unsuccessful',
    build: () {
      when(mockRemoveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Database Failure')));
      return watchlistMovieBloc;
    },
    act: (bloc) => bloc.add(const RemoveFromWatchlist(testMovieDetail)),
    expect: () => [
      const WatchlistMovieMessage('Database Failure'),
    ],
    verify: (bloc) => verify(mockRemoveWatchlist.execute(testMovieDetail)),
  );

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return watchlistMovieBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistMovies()),
    expect: () => [
      WatchlistMovieLoading(),
      WatchListMovieHasData(testMovieList),
    ],
    verify: (bloc) => verify(mockGetWatchlistMovies.execute()),
  );

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Loading, Empty] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => const Right([]));
      return watchlistMovieBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistMovies()),
    expect: () => [
      WatchlistMovieLoading(),
      WatchlistMovieEmpty(),
    ],
    verify: (bloc) => verify(mockGetWatchlistMovies.execute()),
  );

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Loading, Error] when get data is unsuccessful',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return watchlistMovieBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistMovies()),
    expect: () => [
      WatchlistMovieLoading(),
      const WatchlistMovieError('Server Failure'),
    ],
    verify: (bloc) => verify(mockGetWatchlistMovies.execute()),
  );
}
