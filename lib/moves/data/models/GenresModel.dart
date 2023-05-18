import 'package:movina/moves/domain/entity/Genres.dart';

class GenresModel extends Genres
{
  const GenresModel({required super.name, required super.id});

  factory GenresModel.fromjson(Map<String,dynamic> json)=>
      GenresModel(
          name: json["name"],
          id: json["id"]);
}