import '../constant/constant.dart';

class AppApies {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String popularUrl =
      "trending/movie/week?api_key=${AppConstant.tmdbApiKey}&language=en_US&page=1";
}
