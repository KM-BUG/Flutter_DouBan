class ApiConfig {
  ///
  /// 接口地址
  ///
  static const String URL_BASE = "https://douban-api.uieee.com";

  ///
  /// 影院热映
  ///
  static const String URL_MOVIE_HOT = URL_BASE + "/v2/movie/in_theaters";

  ///
  /// 即将上映
  ///
  static const String URL_MOVIE_SOON = URL_BASE + "/v2/movie/coming_soon";

  ///
  /// 前250高分电影 start=2&count=2
  ///
  static const String URL_MOVIE_TOP250 = URL_BASE + "/v2/movie/top250";

  ///
  /// 豆瓣热门
  ///
  static const String URL_MOVIE_DOU_HOT = URL_BASE + "/v2/movie/new_movies";
}
