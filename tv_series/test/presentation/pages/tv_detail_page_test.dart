import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/recommendation_tv/recommendation_tv_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_detail/tv_detail_bloc.dart';
import 'package:tv_series/presentation/bloc/watchlist_tv/watchlist_tv_bloc.dart';
import 'package:tv_series/presentation/pages/tv_detail_page.dart';

import '../../dummy_data/dummy_objects.dart';

class MockTvDetailBloc extends MockBloc<TvDetailEvent, TvDetailState>
    implements TvDetailBloc {}

class FakeTvDetailEvent extends Fake implements TvDetailEvent {}

class FakeTvDetailState extends Fake implements TvDetailState {}

class MockWatchlistTvBloc
    extends MockBloc<WatchlistTvEvent, WatchlistTvState>
    implements WatchlistTvBloc {}

class FakeWatchlistTvEvent extends Fake implements WatchlistTvEvent {}

class FakeWatchlistTvState extends Fake implements WatchlistTvState {}

class MockTvRecommendationBloc
    extends MockBloc<TvRecommendationEvent, TvRecommendationState>
    implements TvRecommendationBloc {}

class FakeTvRecommendationEvent extends Fake
    implements TvRecommendationEvent {}

class FakeTvRecommendationState extends Fake
    implements WatchlistTvState {}

void main() {
  late MockTvDetailBloc mockTvDetailBloc;
  late MockWatchlistTvBloc mockWatchlistTvBloc;
  late MockTvRecommendationBloc mockTvRecommendationBloc;

  setUp(() {
    mockTvDetailBloc = MockTvDetailBloc();
    registerFallbackValue(FakeTvDetailEvent());
    registerFallbackValue(FakeTvDetailState());
    mockWatchlistTvBloc = MockWatchlistTvBloc();
    registerFallbackValue(FakeWatchlistTvEvent());
    registerFallbackValue(FakeWatchlistTvState());
    mockTvRecommendationBloc = MockTvRecommendationBloc();
    registerFallbackValue(FakeTvRecommendationEvent());
    registerFallbackValue(FakeTvRecommendationState());
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvDetailBloc>.value(
          value: mockTvDetailBloc,
        ),
        BlocProvider<WatchlistTvBloc>.value(
          value: mockWatchlistTvBloc,
        ),
        BlocProvider<TvRecommendationBloc>.value(
          value: mockTvRecommendationBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    mockTvDetailBloc.close();
    mockTvRecommendationBloc.close();
    mockWatchlistTvBloc.close();
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state).thenReturn(TvDetailLoading());
    when(() => mockWatchlistTvBloc.state)
        .thenReturn(const WatchlistTvStatus(false));
    when(() => mockTvRecommendationBloc.state)
        .thenReturn(const TvRecommendationHasData([]));

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display tv detail when data',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state)
        .thenReturn(const TvDetailHasData(testTvDetail));
    when(() => mockTvRecommendationBloc.state)
        .thenReturn(TvRecommendationHasData(testTvList));
    when(() => mockWatchlistTvBloc.state)
        .thenReturn(const WatchlistTvStatus(false));

    final nameFinder = find.text('Name');
    final overviewFinder = find.text('Overview');
    final genreFinder = find.text('Action');
    final runtimeFinder = find.text('24m');
    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

    expect(nameFinder, findsOneWidget);
    expect(overviewFinder, findsWidgets);
    expect(genreFinder, findsOneWidget);
    expect(runtimeFinder, findsOneWidget);
    expect(listViewFinder, findsOneWidget);
  });

  testWidgets(
      'Page should display error message when get tv detail unsuccessful',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state)
        .thenReturn(const TvDetailError('Failed'));

    final messageFinder = find.text('Failed');

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

    expect(messageFinder, findsOneWidget);
  });

  testWidgets(
      'Page should display error message when get tv recommendation unsuccessful',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state)
        .thenReturn(const TvDetailHasData(testTvDetail));
    when(() => mockTvRecommendationBloc.state)
        .thenReturn(const TvRecommendationError('Failed'));
    when(() => mockWatchlistTvBloc.state)
        .thenReturn(const WatchlistTvStatus(false));

    final messageFinder = find.text('Failed');

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

    expect(messageFinder, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display add icon when tv not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state)
        .thenReturn(const TvDetailHasData(testTvDetail));
    when(() => mockTvRecommendationBloc.state)
        .thenReturn(const TvRecommendationHasData([]));
    when(() => mockWatchlistTvBloc.state)
        .thenReturn(const WatchlistTvStatus(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when tv is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state)
        .thenReturn(const TvDetailHasData(testTvDetail));
    when(() => mockTvRecommendationBloc.state)
        .thenReturn(const TvRecommendationHasData([]));
    when(() => mockWatchlistTvBloc.state)
        .thenReturn(const WatchlistTvStatus(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => mockTvDetailBloc.state)
        .thenReturn(const TvDetailHasData(testTvDetail));
    when(() => mockTvRecommendationBloc.state)
        .thenReturn(const TvRecommendationHasData([]));

    whenListen(
      mockWatchlistTvBloc,
      Stream.fromIterable([
        const WatchlistTvMessage('Added to Watchlist'),
        const WatchlistTvStatus(true),
      ]),
      initialState: const WatchlistTvStatus(false),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

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
    when(() => mockTvDetailBloc.state)
        .thenReturn(const TvDetailHasData(testTvDetail));
    when(() => mockTvRecommendationBloc.state)
        .thenReturn(const TvRecommendationHasData([]));

    whenListen(
      mockWatchlistTvBloc,
      Stream.fromIterable([
        const WatchlistTvMessage('Failed'),
        const WatchlistTvStatus(true),
      ]),
      initialState: const WatchlistTvStatus(false),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

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
    when(() => mockTvDetailBloc.state)
        .thenReturn(const TvDetailHasData(testTvDetail));
    when(() => mockTvRecommendationBloc.state)
        .thenReturn(const TvRecommendationHasData([]));

    whenListen(
      mockWatchlistTvBloc,
      Stream.fromIterable([
        const WatchlistTvMessage('Removed from Watchlist'),
        const WatchlistTvStatus(false),
      ]),
      initialState: const WatchlistTvStatus(true),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

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
    when(() => mockTvDetailBloc.state)
        .thenReturn(const TvDetailHasData(testTvDetail));
    when(() => mockTvRecommendationBloc.state)
        .thenReturn(const TvRecommendationHasData([]));

    whenListen(
      mockWatchlistTvBloc,
      Stream.fromIterable([
        const WatchlistTvMessage('Failed'),
        const WatchlistTvStatus(false),
      ]),
      initialState: const WatchlistTvStatus(true),
    );

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(makeTestableWidget(const TvDetailPage(id: 1)));

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
