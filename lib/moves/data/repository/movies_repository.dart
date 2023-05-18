import 'package:dartz/dartz.dart';
import 'package:movina/core/error/exception.dart';
import 'package:movina/core/error/failuer.dart';
import 'package:movina/moves/data/dataSource/Movie_remote_data_source.dart';
import 'package:movina/moves/data/models/RecommendationModel.dart';
import 'package:movina/moves/domain/entity/Recommendation.dart';
import 'package:movina/moves/domain/entity/movie.dart';
import 'package:movina/moves/domain/entity/movie_detial.dart';
import 'package:movina/moves/domain/repository/base_movies_repository.dart';
import 'package:movina/moves/domain/usecase/get_movie_details_usecase.dart';
import 'package:movina/moves/domain/usecase/get_recommendation_usecase.dart';

class MovieRepository extends BaseMoviesRepository
{
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;


  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future <Either<Failuer,List<Movie>>> getNowPlayingMovies() async {
    var result=await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
     return Right(result);
    } on ServerException catch(failuer)
    {
      return left(ServerFailuer(failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failuer, List<Movie>>> getPopularMovies() async{
    var result=await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch(failuer)
    {
      return left(ServerFailuer(failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failuer, List<Movie>>> getTopRated() async{
    var result=await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch(failuer)
    {
      return left(ServerFailuer(failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failuer, MovieDetail>> getMovieDetail(MovieDetailsparameters parameters) async{
   var result= await baseMovieRemoteDataSource.getMovieDetail(parameters);

   try
   {
   return Right(result);
   }
   on ServerException catch(faliuer)
    {
      return Left(ServerFailuer(faliuer.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failuer, List<Recommendation>>> getRecommendaions(Recommendaionparameters parameters) async{

    var result =await baseMovieRemoteDataSource.getRecommendation(parameters);
    
    try{
      return Right(result);
    }
    on ServerException catch(faliuer)
    {
      return Left(ServerFailuer(faliuer.errorMessageModel.statusMessage));
    }
    
  }



}