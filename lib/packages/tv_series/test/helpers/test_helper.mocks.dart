// Mocks generated by Mockito 5.4.3 from annotations
// in tv_series/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i28;
import 'dart:typed_data' as _i29;

import 'package:core/data/datasources/database_helper.dart' as _i25;
import 'package:core/utils/failure.dart' as _i8;
import 'package:dartz/dartz.dart' as _i3;
import 'package:http/http.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i24;
import 'package:movie/data/models/movie_table.dart' as _i27;
import 'package:sqflite/sqflite.dart' as _i26;
import 'package:tv_series/data/datasources/tv_local_data_source.dart' as _i22;
import 'package:tv_series/data/datasources/tv_remote_data_source.dart' as _i20;
import 'package:tv_series/data/models/tv_detail_model.dart' as _i4;
import 'package:tv_series/data/models/tv_model.dart' as _i21;
import 'package:tv_series/data/models/tv_table.dart' as _i23;
import 'package:tv_series/domain/entities/tv.dart' as _i9;
import 'package:tv_series/domain/entities/tv_detail.dart' as _i12;
import 'package:tv_series/domain/repositories/tv_repository.dart' as _i2;
import 'package:tv_series/domain/usecases/get_on_the_air_tv.dart' as _i19;
import 'package:tv_series/domain/usecases/get_popular_tv.dart' as _i18;
import 'package:tv_series/domain/usecases/get_top_rated_tv.dart' as _i17;
import 'package:tv_series/domain/usecases/get_tv_detail.dart' as _i11;
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart' as _i13;
import 'package:tv_series/domain/usecases/get_watchlist_tv.dart' as _i10;
import 'package:tv_series/domain/usecases/get_watchlist_tv_status.dart' as _i14;
import 'package:tv_series/domain/usecases/remove_watchlist_tv.dart' as _i16;
import 'package:tv_series/domain/usecases/save_watchlist_tv.dart' as _i15;
import 'package:tv_series/domain/usecases/search_tv.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTvRepository_0 extends _i1.SmartFake implements _i2.TvRepository {
  _FakeTvRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvDetailModel_2 extends _i1.SmartFake implements _i4.TvDetailModel {
  _FakeTvDetailModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_3 extends _i1.SmartFake implements _i5.Response {
  _FakeResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_4 extends _i1.SmartFake
    implements _i5.StreamedResponse {
  _FakeStreamedResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SearchTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchTv extends _i1.Mock implements _i6.SearchTv {
  MockSearchTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> execute(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetWatchlistTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTv extends _i1.Mock implements _i10.GetWatchlistTv {
  MockGetWatchlistTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetTvDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvDetail extends _i1.Mock implements _i11.GetTvDetail {
  MockGetTvDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, _i12.TvDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, _i12.TvDetail>>.value(
            _FakeEither_1<_i8.Failure, _i12.TvDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, _i12.TvDetail>>);
}

/// A class which mocks [GetTvRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvRecommendations extends _i1.Mock
    implements _i13.GetTvRecommendations {
  MockGetTvRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> execute(dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetWatchListTvStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListTvStatus extends _i1.Mock
    implements _i14.GetWatchListTvStatus {
  MockGetWatchListTvStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i7.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [SaveWatchlistTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlistTv extends _i1.Mock implements _i15.SaveWatchlistTv {
  MockSaveWatchlistTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, String>> execute(
          _i12.TvDetail? tvDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tvDetail],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, String>>.value(
            _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tvDetail],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, String>>);
}

/// A class which mocks [RemoveWatchlistTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistTv extends _i1.Mock implements _i16.RemoveWatchlistTv {
  MockRemoveWatchlistTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, String>> execute(
          _i12.TvDetail? tvDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tvDetail],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, String>>.value(
            _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tvDetail],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, String>>);
}

/// A class which mocks [GetTopRatedTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTv extends _i1.Mock implements _i17.GetTopRatedTv {
  MockGetTopRatedTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetPopularTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularTv extends _i1.Mock implements _i18.GetPopularTv {
  MockGetPopularTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetOnTheAirTv].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetOnTheAirTv extends _i1.Mock implements _i19.GetOnTheAirTv {
  MockGetOnTheAirTv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvRepository);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i2.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> getOnTheAirTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnTheAirTv,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getOnTheAirTv,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> getPopularTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTv,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getPopularTv,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> getTopRatedTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTv,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getTopRatedTv,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, _i12.TvDetail>> getTvDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, _i12.TvDetail>>.value(
            _FakeEither_1<_i8.Failure, _i12.TvDetail>(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, _i12.TvDetail>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> getTvRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecommendations,
          [id],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getTvRecommendations,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> searchTv(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTv,
          [query],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #searchTv,
            [query],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, String>> saveWatchlist(
          _i12.TvDetail? tvDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [tvDetail],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, String>>.value(
            _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [tvDetail],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, String>>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, String>> removeWatchlist(
          _i12.TvDetail? tvDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tvDetail],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, String>>.value(
            _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [tvDetail],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, String>>);

  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>> getWatchlistTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_1<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getWatchlistTv,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i20.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i21.TvModel>> getOnTheAirTv() => (super.noSuchMethod(
        Invocation.method(
          #getOnTheAirTv,
          [],
        ),
        returnValue: _i7.Future<List<_i21.TvModel>>.value(<_i21.TvModel>[]),
      ) as _i7.Future<List<_i21.TvModel>>);

  @override
  _i7.Future<List<_i21.TvModel>> getPopularTv() => (super.noSuchMethod(
        Invocation.method(
          #getPopularTv,
          [],
        ),
        returnValue: _i7.Future<List<_i21.TvModel>>.value(<_i21.TvModel>[]),
      ) as _i7.Future<List<_i21.TvModel>>);

  @override
  _i7.Future<List<_i21.TvModel>> getTopRatedTv() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTv,
          [],
        ),
        returnValue: _i7.Future<List<_i21.TvModel>>.value(<_i21.TvModel>[]),
      ) as _i7.Future<List<_i21.TvModel>>);

  @override
  _i7.Future<_i4.TvDetailModel> getTvDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i7.Future<_i4.TvDetailModel>.value(_FakeTvDetailModel_2(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i4.TvDetailModel>);

  @override
  _i7.Future<List<_i21.TvModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecommendations,
          [id],
        ),
        returnValue: _i7.Future<List<_i21.TvModel>>.value(<_i21.TvModel>[]),
      ) as _i7.Future<List<_i21.TvModel>>);

  @override
  _i7.Future<List<_i21.TvModel>> searchTv(String? query) => (super.noSuchMethod(
        Invocation.method(
          #searchTv,
          [query],
        ),
        returnValue: _i7.Future<List<_i21.TvModel>>.value(<_i21.TvModel>[]),
      ) as _i7.Future<List<_i21.TvModel>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i22.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i23.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [tv],
        ),
        returnValue: _i7.Future<String>.value(_i24.dummyValue<String>(
          this,
          Invocation.method(
            #insertWatchlist,
            [tv],
          ),
        )),
      ) as _i7.Future<String>);

  @override
  _i7.Future<String> removeWatchlist(_i23.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tv],
        ),
        returnValue: _i7.Future<String>.value(_i24.dummyValue<String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [tv],
          ),
        )),
      ) as _i7.Future<String>);

  @override
  _i7.Future<_i23.TvTable?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i7.Future<_i23.TvTable?>.value(),
      ) as _i7.Future<_i23.TvTable?>);

  @override
  _i7.Future<List<_i23.TvTable>> getWatchlistTv() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i7.Future<List<_i23.TvTable>>.value(<_i23.TvTable>[]),
      ) as _i7.Future<List<_i23.TvTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i25.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i26.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i7.Future<_i26.Database?>.value(),
      ) as _i7.Future<_i26.Database?>);

  @override
  _i7.Future<int> insertWatchlist(_i27.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<int> removeWatchlist(_i27.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i7.Future<Map<String, dynamic>?>.value(),
      ) as _i7.Future<Map<String, dynamic>?>);

  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i7.Future<List<Map<String, dynamic>>>);

  @override
  _i7.Future<int> insertWatchlistTv(_i23.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTv,
          [tv],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<int> removeWatchlistTv(_i23.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTv,
          [tv],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<Map<String, dynamic>?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i7.Future<Map<String, dynamic>?>.value(),
      ) as _i7.Future<Map<String, dynamic>?>);

  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i5.Response>);

  @override
  _i7.Future<_i5.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i5.Response>);

  @override
  _i7.Future<_i5.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i28.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);

  @override
  _i7.Future<_i5.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i28.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);

  @override
  _i7.Future<_i5.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i28.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);

  @override
  _i7.Future<_i5.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i28.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i5.Response>.value(_FakeResponse_3(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i5.Response>);

  @override
  _i7.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<String>.value(_i24.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<String>);

  @override
  _i7.Future<_i29.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i29.Uint8List>.value(_i29.Uint8List(0)),
      ) as _i7.Future<_i29.Uint8List>);

  @override
  _i7.Future<_i5.StreamedResponse> send(_i5.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i7.Future<_i5.StreamedResponse>.value(_FakeStreamedResponse_4(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i7.Future<_i5.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
