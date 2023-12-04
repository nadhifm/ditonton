import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/data/models/tv_response.dart';

import '../../json_reader.dart';

void main() {

  test('should return a JSON map containing proper data', () async {
    final tJson = {
      "results": [
        {
          "adult": false,
          "backdrop_path": "/path.jpg",
          "genre_ids": [
            1,
            2,
            3,
            4
          ],
          "id": 1,
          "original_language": "en",
          "original_name": "Original Name",
          "overview": "Overview",
          "popularity": 1.0,
          "poster_path": "/path.jpg",
          "first_air_date": "2023-11-11",
          "name": "Name",
          "vote_average": 1.0,
          "vote_count": 1
        }
      ],
    };
    final testTvResponse = TvResponse.fromJson(
        json.decode(readJson('dummy_data/on_the_air_tv.json')));
    final result = testTvResponse.toJson();
    expect(result, tJson);
  });
}