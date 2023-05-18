import 'package:dartz/dartz.dart';
import 'package:movina/core/BaseUseCase.dart';
import 'package:movina/moves/domain/entity/movie.dart';
import 'package:movina/moves/domain/repository/base_movies_repository.dart';

import '../../../core/error/failuer.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
 final BaseMoviesRepository baseMoviesRepository;


  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
 @override
 Future <Either< Failuer,List<Movie>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}