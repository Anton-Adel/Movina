class ApiConstant{

  static const BaseUrl="https://api.themoviedb.org/3";
  static const Key="f504bf2d246bde19ac8ce0c104ba3d5d";
  static const NowPlayingMoviesUrl="$BaseUrl/movie/now_playing?api_key=$Key";
  static const TopRatedMoviesUrl="$BaseUrl/movie/top_rated?api_key=$Key";
  static const PopularMoviesUrl="$BaseUrl/movie/popular?api_key=$Key";


  static String MovieDetailUrl(int MovieID)=>"$BaseUrl/movie/$MovieID?api_key=$Key";


  static String RecommendationUrl(int MovieID)=>"$BaseUrl/movie/$MovieID/recommendations?api_key=$Key";

  static const baseImageUrl="https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path)=> "$baseImageUrl$path";

}