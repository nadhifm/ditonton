import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {

  test('should return a JSON map containing proper data', () async {
    final tJson = {
      "adult": false,
      "backdrop_path": "/a6ptrTUH1c5OdWanjyYtAkOuYD0.jpg",
      "genre_ids": [
        10759,
        35,
        16,
      ],
      "id": 37854,
      "original_language": "ja",
      "original_name": "ワンピース",
      "overview":
      "Years ago, the fearsome Pirate King, Gol D. Roger was executed leaving a huge pile of treasure and the famous \"One Piece\" behind. Whoever claims the \"One Piece\" will be named the new King of the Pirates.\n\nMonkey D. Luffy, a boy who consumed a \"Devil Fruit,\" decides to follow in the footsteps of his idol, the pirate Shanks, and find the One Piece. It helps, of course, that his body has the properties of rubber and that he's surrounded by a bevy of skilled fighters and thieves to help him along the way.\n\nLuffy will do anything to get the One Piece and become King of the Pirates!",
      "popularity": 124.214,
      "poster_path": "/fcXdJlbSdUEeMSJFsXKsznGwwok.jpg",
      "first_air_date": "1999-10-20",
      "name": "One Piece",
      "vote_average": 8.724,
      "vote_count": 4175
    };
    final result = testTvModel.toJson();
    expect(result, tJson);
  });
}