import 'package:dartz/dartz.dart';
import 'package:movina/moves/domain/entity/Recommendation.dart';
import 'package:movina/moves/domain/entity/movie.dart';
import 'package:movina/moves/domain/entity/movie_detial.dart';
import 'package:movina/moves/domain/usecase/get_movie_details_usecase.dart';
import 'package:movina/moves/domain/usecase/get_recommendation_usecase.dart';

import '../../../core/error/failuer.dart';

abstract class BaseMoviesRepository{

  Future <Either< Failuer,List<Movie>>> getNowPlayingMovies();
  Future <Either< Failuer,List<Movie>>> getPopularMovies();
  Future <Either< Failuer,List<Movie>>>getTopRated();
  Future <Either< Failuer,MovieDetail>> getMovieDetail(MovieDetailsparameters parameters);
  Future <Either< Failuer,List<Recommendation>>> getRecommendaions(Recommendaionparameters parameters);

}