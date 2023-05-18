import 'package:movina/moves/data/models/GenresModel.dart';
import 'package:movina/moves/domain/entity/movie_detial.dart';

class MovieDetialModel extends MovieDetail
{
  const MovieDetialModel({required super.backdropPath, required super.id, required super.genres, required super.overview, required super.title, required super.releaseDate, required super.runtime, required super.voteAverage});
  
  factory MovieDetialModel.fromjson(Map<String,dynamic> json)=>
      MovieDetialModel
        (backdropPath: json["backdrop_path"],
          id: json["id"],
          genres: List<GenresModel>.from(json["genres"].map((e)=>GenresModel.fromjson(e))),
          overview: json["overview"],
          title: json["overview"],
          releaseDate: json["release_date"],
          runtime: json["runtime"],
          voteAverage: json["vote_average"].toDouble());
}
    