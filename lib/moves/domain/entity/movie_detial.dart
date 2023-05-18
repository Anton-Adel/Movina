import 'package:equatable/equatable.dart';
import 'package:movina/moves/domain/entity/Genres.dart';

class MovieDetail extends Equatable{
  final String backdropPath;
  final int id;
  final List<Genres> genres;
  final String overview;
  final String title;
  final String releaseDate;
  final int runtime;
  final double voteAverage;


 const MovieDetail(
      {
        required this.backdropPath,
        required this.id,
        required this.genres,

        required this.overview,
        required this.title,
        required this.releaseDate,
        required this.runtime,
        required this.voteAverage
     });

  @override
  // TODO: implement props
  List<Object?> get props => [
    backdropPath,
    id,
    genres,

    overview,
    title,
    releaseDate,
    runtime,
    voteAverage];
}