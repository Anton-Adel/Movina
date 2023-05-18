import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movina/core/error/failuer.dart';

abstract class BaseUseCase<T,parameters> {

  Future<Either<Failuer,T>> call(parameters parameters);

}

class NoParameters extends Equatable
{


  @override
  // TODO: implement props
  List<Object?> get props => [];

  const NoParameters();
}