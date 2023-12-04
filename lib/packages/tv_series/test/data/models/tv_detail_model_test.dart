import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {

  test('should return a JSON map containing proper data', () async {
    final tJson = {
      "adult": false,
      "backdrop_path": "/path.jpg",
      "created_by": [],
      "episode_run_time": [
        24
      ],
      "first_air_date": "1999-10-20",
      "genres": [
        {
          "id": 1,
          "name": "Action"
        }
      ],
      "homepage": "https://google.com",
      "id": 1,
      "in_production": true,
      "languages": [
        "en"
      ],
      "last_air_date": "2023-11-19",
      "name": "Name",
      "number_of_episodes": 1,
      "number_of_seasons": 1,
      "origin_country": [
        "US"
      ],
      "original_language": "en",
      "original_name": "Original Name",
      "overview": "Overview",
      "popularity": 1.0,
      "poster_path": "/path.jpg",
      "status": "Status",
      "tagline": "Tagline",
      "type": "Type",
      "vote_average": 1.0,
      "vote_count": 1
    };
    final result = testTvDetailModel.toJson();
    expect(result, tJson);
  });
}