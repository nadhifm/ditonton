import 'package:core/data/models/genre_model.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:tv_series/data/models/tv_detail_model.dart';
import 'package:tv_series/data/models/tv_model.dart';
import 'package:tv_series/data/models/tv_table.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';

const testTvTable = TvTable(
  id: 1,
  name: 'Name',
  posterPath: '/path.jpg',
  overview: 'Overview',
);

final testTvMap = {
  'id': 1,
  'overview': 'Overview',
  'posterPath': '/path.jpg',
  'name': 'Name',
};

const testTvModel = TvModel(
  adult: false,
  backdropPath: "/a6ptrTUH1c5OdWanjyYtAkOuYD0.jpg",
  genreIds: [
    10759,
    35,
    16,
  ],
  id: 37854,
  originalLanguage: "ja",
  originalName: "ワンピース",
  overview:
      "Years ago, the fearsome Pirate King, Gol D. Roger was executed leaving a huge pile of treasure and the famous \"One Piece\" behind. Whoever claims the \"One Piece\" will be named the new King of the Pirates.\n\nMonkey D. Luffy, a boy who consumed a \"Devil Fruit,\" decides to follow in the footsteps of his idol, the pirate Shanks, and find the One Piece. It helps, of course, that his body has the properties of rubber and that he's surrounded by a bevy of skilled fighters and thieves to help him along the way.\n\nLuffy will do anything to get the One Piece and become King of the Pirates!",
  popularity: 124.214,
  posterPath: "/fcXdJlbSdUEeMSJFsXKsznGwwok.jpg",
  firstAirDate: "1999-10-20",
  name: "One Piece",
  voteAverage: 8.724,
  voteCount: 4175,
);

final testTvModelList = <TvModel>[testTvModel];

const testTv = Tv(
  adult: false,
  backdropPath: "/a6ptrTUH1c5OdWanjyYtAkOuYD0.jpg",
  genreIds: [
    10759,
    35,
    16,
  ],
  id: 37854,
  originalName: "ワンピース",
  overview:
      "Years ago, the fearsome Pirate King, Gol D. Roger was executed leaving a huge pile of treasure and the famous \"One Piece\" behind. Whoever claims the \"One Piece\" will be named the new King of the Pirates.\n\nMonkey D. Luffy, a boy who consumed a \"Devil Fruit,\" decides to follow in the footsteps of his idol, the pirate Shanks, and find the One Piece. It helps, of course, that his body has the properties of rubber and that he's surrounded by a bevy of skilled fighters and thieves to help him along the way.\n\nLuffy will do anything to get the One Piece and become King of the Pirates!",
  popularity: 124.214,
  posterPath: "/fcXdJlbSdUEeMSJFsXKsznGwwok.jpg",
  firstAirDate: "1999-10-20",
  name: "One Piece",
  voteAverage: 8.724,
  voteCount: 4175,
);

final testTvList = <Tv>[testTv];

const testTvDetailModel = TvDetailModel(
  adult: false,
  backdropPath: "/path.jpg",
  createdBy: [],
  episodeRunTime: [
    24,
  ],
  firstAirDate: "1999-10-20",
  genres: [
    GenreModel(id: 1, name: "Action"),
  ],
  homepage: "https://google.com",
  id: 1,
  inProduction: true,
  languages: [
    "en",
  ],
  lastAirDate: "2023-11-19",
  name: "Name",
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  originCountry: [
    "US",
  ],
  originalLanguage: "en",
  originalName: "Original Name",
  overview: "Overview",
  popularity: 1.0,
  posterPath: "/path.jpg",
  status: "Status",
  tagline: "Tagline",
  type: "Type",
  voteAverage: 1.0,
  voteCount: 1,
);

const testTvDetail = TvDetail(
  adult: false,
  backdropPath: "/path.jpg",
  episodeRunTime: 24,
  firstAirDate: "1999-10-20",
  genres: [
    Genre(id: 1, name: "Action"),
  ],
  id: 1,
  name: "Name",
  originalName: "Original Name",
  overview: "Overview",
  posterPath: "/path.jpg",
  voteAverage: 1.0,
  voteCount: 1,
);

const testWatchlistTv = Tv.watchlist(
  id: 1,
  name: 'Name',
  posterPath: '/path.jpg',
  overview: 'Overview',
);
