import 'package:equatable/equatable.dart';

abstract class Failuer extends Equatable{
  final String message;

  const Failuer(this.message);
  List<Object?> get props => [message];

}

class ServerFailuer extends Failuer{
 const ServerFailuer(super.message);
}
