import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movina/core/BaseUseCase.dart';
import 'package:movina/core/error/failuer.dart';
import 'package:movina/moves/domain/entity/movie_detial.dart';
import 'package:movina/moves/domain/repository/base_movies_repository.dart';

class GetMovieDetialUseCase extends BaseUseCase<MovieDetail,MovieDetailsparameters>
{
  final BaseMoviesRepository baseMoviesRepository;


  GetMovieDetialUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failuer, MovieDetail>> call(MovieDetailsparameters parameters) async{
    return await baseMoviesRepository.getMovieDetail(parameters);

  }

}

class MovieDetailsparameters extends Equatable
{
  final int id;
  MovieDetailsparameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}