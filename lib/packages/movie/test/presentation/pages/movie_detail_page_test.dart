import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_recommendation/recommendation_movie_bloc.dart';
import 'package:movie/presentation/bloc/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';

import '../../dummy_data/dummy_objects.dart';

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}

class FakeMovieDetailEvent extends Fake implements MovieDetailEvent {}

class FakeMovieDetailState extends Fake implements MovieDetailState {}

class MockWatchlistMovieBloc
    extends MockBloc<WatchlistMovieEvent, WatchlistMovieState>
    implements WatchlistMovieBloc {}

class FakeWatchlistMovieEvent extends Fake implements WatchlistMovieEvent {}

class FakeWatchlistMovieState extends Fake implements WatchlistMovieState {}

class MockMovieRecommendationBloc
    extends MockBloc<MovieRecommendationEvent, MovieRecommendationState>
    implements MovieRecommendationBloc {}

class FakeMovieRecommendationEvent extends Fake
    implements MovieRecommendationEvent {}

class FakeMovieRecommendationState extends Fake
    implements WatchlistMovieState {}

void main() {
  late MockMovieDetailBloc mockMovieDetailBloc;
  late MockWatchlistMovieBloc mockWatchlistMovieBloc;
  late MockMovieRecommendationBloc mockMovieRecommendationBloc;

  setUp(() {
    mockMovieDetailBloc = MockMovieDetailBloc();
    registerFallbackValue(FakeMovieDetailEvent());
    registerFallbackValue(FakeMovieDetailState());
    mockWatchlistMovieBloc = MockWatchlistMovieBloc();
    registerFallbackValue(FakeWatchlistMovieEvent());
    registerFallbackValue(FakeWatchlistMovieState());
    mockMovieRecommendationBloc = MockMovieRecommendationBloc();
    registerFallbackValue(FakeMovieRecommendationEvent());
    registerFallbackValue(FakeMovieRecommendationState());
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailBloc>.value(
          value: mockMovieDetailBloc,
        ),
        BlocProvider<WatchlistMovieBloc>.value(
          value: mockWatchlistMovieBloc,
        ),
        BlocProvider<MovieRecommendationBloc>.value(
          value: mockMovieRecommendationBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    mockMovieDetailBloc.close();
    mockMovieRecommendationBloc.close();
    mockWatchlistMovieBloc.close();
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state).thenReturn(MovieDetailLoading());
    when(() => mockWatchlistMovieBloc.state)
        .thenReturn(const WatchlistMovieStatus(false));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(const MovieRecommendationHasData([]));

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display movie detail when data',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(MovieRecommendationHasData(testMovieList));
    when(() => mockWatchlistMovieBloc.state)
        .thenReturn(const WatchlistMovieStatus(false));

    final titleFinder = find.text('title');
    final overviewFinder = find.text('overview');
    final genreFinder = find.text('Action');
    final runtimeFinder = find.text('2h 0m');
    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(titleFinder, findsOneWidget);
    expect(overviewFinder, findsOneWidget);
    expect(genreFinder, findsOneWidget);
    expect(runtimeFinder, findsOneWidget);
    expect(listViewFinder, findsOneWidget);
  });

  testWidgets(
      'Page should display error message when get movie detail unsuccessful',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailError('Failed'));

    final messageFinder = find.text('Failed');

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(messageFinder, findsOneWidget);
  });

  testWidgets(
      'Page should display error message when get movie recommendation unsuccessful',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(const MovieRecommendationError('Failed'));
    when(() => mockWatchlistMovieBloc.state)
        .thenReturn(const WatchlistMovieStatus(false));

    final messageFinder = find.text('Failed');

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(messageFinder, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(const MovieRecommendationHasData([]));
    when(() => mockWatchlistMovieBloc.state)
        .thenReturn(const WatchlistMovieStatus(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(const MovieRecommendationHasData([]));
    when(() => mockWatchlistMovieBloc.state)
        .thenReturn(const WatchlistMovieStatus(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(const MovieRecommendationHasData([]));

    whenListen(
      mockWatchlistMovieBloc,
      Stream.fromIterable([
        const WatchlistMovieMessage('Added to Watchlist'),
        const WatchlistMovieStatus(true),
      ]),
      initialState: const WatchlistMovieStatus(false),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byIcon(Icons.check), findsOneWidget);

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(const MovieRecommendationHasData([]));

    whenListen(
      mockWatchlistMovieBloc,
      Stream.fromIterable([
        const WatchlistMovieMessage('Failed'),
        const WatchlistMovieStatus(true),
      ]),
      initialState: const WatchlistMovieStatus(false),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byIcon(Icons.check), findsOneWidget);

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when remove from watchlist',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(const MovieRecommendationHasData([]));

    whenListen(
      mockWatchlistMovieBloc,
      Stream.fromIterable([
        const WatchlistMovieMessage('Removed from Watchlist'),
        const WatchlistMovieStatus(false),
      ]),
      initialState: const WatchlistMovieStatus(true),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Removed from Watchlist'), findsOneWidget);
  });
  //
  testWidgets(
      'Watchlist button should display AlertDialog when remove from watchlist failed',
      (WidgetTester tester) async {
    when(() => mockMovieDetailBloc.state)
        .thenReturn(const MovieDetailHasData(testMovieDetail));
    when(() => mockMovieRecommendationBloc.state)
        .thenReturn(const MovieRecommendationHasData([]));

    whenListen(
      mockWatchlistMovieBloc,
      Stream.fromIterable([
        const WatchlistMovieMessage('Failed'),
        const WatchlistMovieStatus(false),
      ]),
      initialState: const WatchlistMovieStatus(true),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
