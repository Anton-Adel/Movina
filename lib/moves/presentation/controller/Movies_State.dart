import 'package:equatable/equatable.dart';
import 'package:movina/core/utls/enums.dart';

import '../../domain/entity/movie.dart';

class MoviesState extends Equatable{

  final List<Movie> movies;
  final RequestStates nowPlayingState;
  final String message;
  final List<Movie> moviesTopRated;
  final String messageTopRated;
  final RequestStates TopRatedState;
  final List<Movie> moviesPopular;
  final String messagePopular;
  final RequestStates PopularState;
  const MoviesState({
    this.moviesPopular=const[],
    this.moviesTopRated=const [],
    this.movies = const[],
    this.nowPlayingState = RequestStates.loading,
    this.message = "",
    this.TopRatedState = RequestStates.loading,
    this.messageTopRated = "",
    this.PopularState = RequestStates.loading,
    this.messagePopular = ""
  }
  );

  MoviesState copyWith(
  {
     List<Movie>? movies,
     RequestStates? nowPlayingState,
     String? message,
     List<Movie>? moviesTopRated,
     String? messageTopRated,
     RequestStates? TopRatedState,
     List<Movie>? moviesPopular,
     String? messagePopular,
     RequestStates? PopularState,
}
)
  {
    return MoviesState(
      movies: movies?? this.movies,
      nowPlayingState: nowPlayingState?? this.nowPlayingState,
      message: message?? this.message,
      moviesTopRated: moviesTopRated??this.moviesTopRated,
      messageTopRated: messageTopRated?? this.messageTopRated,
      TopRatedState: TopRatedState?? this.TopRatedState,
      moviesPopular: moviesPopular?? this.moviesPopular,
      messagePopular: messagePopular?? this.messagePopular,
      PopularState: PopularState??this.PopularState
    );
  }

  @override

  List<Object?> get props => [movies,nowPlayingState,message,TopRatedState,messageTopRated,moviesTopRated,moviesPopular,PopularState,messagePopular];


}