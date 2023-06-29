class ApiConstance{
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "c49eb85fcf38aab1abb0e46ee513911a";

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playingg?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
 static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl =
      "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path)=>'$baseImageUrl$path';
}