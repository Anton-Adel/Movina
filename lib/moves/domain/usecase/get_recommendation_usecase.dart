import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movina/core/BaseUseCase.dart';
import 'package:movina/core/error/failuer.dart';
import 'package:movina/moves/domain/entity/Recommendation.dart';
import 'package:movina/moves/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,Recommendaionparameters>{

  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failuer, List<Recommendation>>> call(Recommendaionparameters parameters) async{

   return await baseMoviesRepository.getRecommendaions(parameters);
  }
}
class Recommendaionparameters extends Equatable
{
  final int id;


  Recommendaionparameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}