import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movina/core/BaseUseCase.dart';
import 'package:movina/core/utls/enums.dart';
import 'package:movina/moves/data/dataSource/Movie_remote_data_source.dart';
import 'package:movina/moves/data/repository/movies_repository.dart';
import 'package:movina/moves/domain/repository/base_movies_repository.dart';
import 'package:movina/moves/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movina/moves/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movina/moves/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movina/moves/presentation/controller/Movies_Event.dart';
import 'package:movina/moves/presentation/controller/Movies_State.dart';

import '../../../core/Services/ServicesLocator.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>
{
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase topRatedMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase,this.topRatedMoviesUseCase,this.getPopularMoviesUseCase): super(MoviesState()){

    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);


    on<GetPopularMoviesEvent>(_getPopularMovies);


  }


  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
    var result=await getNowPlayingMoviesUseCase(const NoParameters());

    //print(result);

    //emit(const MoviesState(nowPlayingState: RequestStates.loaded));
    result.fold((l) {
      return emit(
          state.copyWith(nowPlayingState: RequestStates.error,message: l.message)

      );
    }, (r){
      // print("hiiii");
      return emit(
          state.copyWith(movies: r,nowPlayingState: RequestStates.loaded)
      );
    });
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    var result=await topRatedMoviesUseCase(const NoParameters());
    //emit(const MoviesState(TopRatedState: RequestStates.loaded));
    result.fold((l) {
      return emit(
          state.copyWith(TopRatedState: RequestStates.error,messageTopRated: l.message)
      );
    }, (r) => emit(
        state.copyWith(moviesTopRated: r,TopRatedState: RequestStates.loaded)
    )
    );
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    var result= await getPopularMoviesUseCase(const NoParameters());
    result.fold((l) {
      return emit(state.copyWith(PopularState: RequestStates.error,messagePopular: l.message));
    }, (r)
    {
      return emit (state.copyWith(moviesPopular: r,PopularState: RequestStates.loaded));
    });
  }
}