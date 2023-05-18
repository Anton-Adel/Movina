import 'package:dio/dio.dart';
import 'package:movina/core/error/exception.dart';
import 'package:movina/core/network/ErrorMessageModel.dart';
import 'package:movina/core/network/api_constatnts.dart';
import 'package:movina/core/utls/constants.dart';
import 'package:movina/moves/data/models/MovieDetailsModel.dart';
import 'package:movina/moves/data/models/MovieModel.dart';
import 'package:movina/moves/data/models/RecommendationModel.dart';
import 'package:movina/moves/domain/usecase/get_movie_details_usecase.dart';
import 'package:movina/moves/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource
{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetialModel> getMovieDetail(MovieDetailsparameters parameters);
  Future<List<RecommendationModel>> getRecommendation(Recommendaionparameters parameters);


}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource{

  @override
 Future<List<MovieModel>> getNowPlayingMovies() async{
    final respons=await Dio().get("${ApiConstant.NowPlayingMoviesUrl}");
    if(respons.statusCode==200)
      {
        return List<MovieModel>.from((respons.data["results"] as List).map((e) => MovieModel.fromjson(e)));
      }
    else
      {
        throw ServerException(ErrorMessageModel.fromjson(respons.data));
      }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final respons=await Dio().get("${ApiConstant.PopularMoviesUrl}");
    if(respons.statusCode==200)
    {
      return List<MovieModel>.from((respons.data["results"] as List).map((e) => MovieModel.fromjson(e)));
    }
    else
    {
      throw ServerException(ErrorMessageModel.fromjson(respons.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final respons=await Dio().get("${ApiConstant.TopRatedMoviesUrl}");
    if(respons.statusCode==200)
    {
      return List<MovieModel>.from((respons.data["results"] as List).map((e) => MovieModel.fromjson(e)));
    }
    else
    {
      throw ServerException(ErrorMessageModel.fromjson(respons.data));
    }
  }

  @override
  Future<MovieDetialModel> getMovieDetail(MovieDetailsparameters parameters) async{
    var response = await Dio().get("${ApiConstant.MovieDetailUrl(parameters.id)}");
    if(response.statusCode==200)
      {
        return MovieDetialModel.fromjson(response.data);
      }
    else
      {
        throw ServerException(ErrorMessageModel.fromjson(response.data));
      }

  }

  @override
  Future<List<RecommendationModel>> getRecommendation(Recommendaionparameters parameters) async {
    var response =await Dio().get("${ApiConstant.RecommendationUrl(parameters.id)}");
    if(response.statusCode==200)
      {

        return List<RecommendationModel>.from((response.data["results"] as List).map((e) {

          return RecommendationModel.fromjson(e);}));

      }
    else
      {
        throw ServerException(ErrorMessageModel.fromjson(response.data));
      }
    
    
    
  }
}















