import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel(this.statusCode, this.statusMessage, this.success);
  
  factory ErrorMessageModel.fromjson(Map<String,dynamic>json)=>
      ErrorMessageModel(json["status_code"], json["status_message"], json["success"]);

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode,statusMessage,success];


}