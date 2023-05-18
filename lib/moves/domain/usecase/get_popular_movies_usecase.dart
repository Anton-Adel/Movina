import 'package:dartz/dartz.dart';

import '../../../core/BaseUseCase.dart';
import '../../../core/error/failuer.dart';
import '../entity/movie.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{

  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future <Either< Failuer,List<Movie>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getPopularMovies();
  }
}