import 'package:movina/core/network/ErrorMessageModel.dart';

class ServerException implements Exception{

  final ErrorMessageModel errorMessageModel;

 const ServerException(this.errorMessageModel);
}
