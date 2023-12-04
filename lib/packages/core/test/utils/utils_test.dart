import 'package:core/domain/entities/genre.dart';
import 'package:core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should object RouteObserver', () {
    expect(routeObserver, isA<RouteObserver<ModalRoute>>());
  });

  test('should return format genre', () async {
    final genres = [
      const Genre(id: 1, name: 'Action'),
      const Genre(id: 2, name: 'Comedy'),
    ];
    final result = showGenres(genres);
    expect(result, 'Action, Comedy');
  });

  test('should return format hour duration', () async {
    final result = showDuration(90);
    expect(result, '1h 30m');
  });

  test('should return format minutes duration', () async {
    final result = showDuration(24);
    expect(result, '24m');
  });
}
