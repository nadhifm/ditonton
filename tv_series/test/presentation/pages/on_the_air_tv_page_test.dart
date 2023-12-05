import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/on_the_air_tv/on_the_air_tv_bloc.dart';
import 'package:tv_series/presentation/pages/on_the_air_tv_page.dart';
import 'package:tv_series/presentation/widgets/tv_card_list.dart';

import '../../dummy_data/dummy_objects.dart';

class MockOnTheAirTvBloc
    extends MockBloc<OnTheAirTvEvent, OnTheAirTvState>
    implements OnTheAirTvBloc {}

class FakeOnTheAirTvEvent extends Fake implements OnTheAirTvEvent {}

class FakeOnTheAirTvState extends Fake implements OnTheAirTvState {}

void main() {
  late MockOnTheAirTvBloc mockOnTheAirTvBloc;

  setUp(() {
    mockOnTheAirTvBloc = MockOnTheAirTvBloc();
    registerFallbackValue(FakeOnTheAirTvEvent());
    registerFallbackValue(FakeOnTheAirTvState());
  });

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnTheAirTvBloc>.value(
          value: mockOnTheAirTvBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockOnTheAirTvBloc.state).thenReturn(OnTheAirTvLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const OnTheAirTvPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockOnTheAirTvBloc.state)
        .thenReturn(OnTheAirTvHasData(testTvList));

    final listViewFinder = find.byType(ListView);
    final tvCardFinder = find.byType(TvCard);

    await tester.pumpWidget(makeTestableWidget(const OnTheAirTvPage()));

    expect(listViewFinder, findsOneWidget);
    expect(tvCardFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockOnTheAirTvBloc.state)
        .thenReturn(const OnTheAirTvError('Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const OnTheAirTvPage()));

    expect(textFinder, findsOneWidget);
  });
}
