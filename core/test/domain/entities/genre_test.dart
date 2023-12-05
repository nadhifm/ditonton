import 'package:core/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Should return true', () {
    const Genre genre1 = Genre(id: 1, name: "Action");
    const Genre genre2 = Genre(id: 1, name: "Action");

    expect(genre1 == genre2, true);
  });

  test('Should return false', () {
    const Genre genre1 = Genre(id: 1, name: "Action");
    const Genre genre2 = Genre(id: 2, name: "Comedy");

    expect(genre1 == genre2, false);
  });
}