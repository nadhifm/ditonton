import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvRecommendations usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvRecommendations(mockTvRepository);
  });

  const tId = 1;

  test('should get list of tv recommendations from the repository',
      () async {
    // arrange
    when(mockTvRepository.getTvRecommendations(tId))
        .thenAnswer((_) async => Right(testTvList));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(testTvList));
  });
}
