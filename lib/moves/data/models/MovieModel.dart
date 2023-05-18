
import 'dart:ffi';

import '../../domain/entity/movie.dart';

class MovieModel extends Movie{
  const MovieModel({required super.id, required super.backdropPath, required super.title, required super.genreIds, required super.overview, required super.voteAverage, required super.releaseDate});

  factory MovieModel.fromjson(Map<String,dynamic>json)=>
      MovieModel(

        id: json["id"],
      backdropPath:  json["backdrop_path"],
        title: json["title"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
       overview:  json["overview"],
        voteAverage: json["vote_average"].toDouble(),
       releaseDate:  json["release_date"]
          ,
      );

}