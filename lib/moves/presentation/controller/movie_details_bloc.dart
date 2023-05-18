import 'dart:async';


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movina/core/utls/enums.dart';
import 'package:movina/moves/domain/entity/Recommendation.dart';
import 'package:movina/moves/domain/entity/movie_detial.dart';
import 'package:movina/moves/domain/usecase/get_movie_details_usecase.dart';
import 'package:movina/moves/domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetialUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendaion);
  }

  final GetMovieDetialUseCase getMovieDetialUseCase;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit) async {
    var result = await getMovieDetialUseCase(
        MovieDetailsparameters(id: event.id));
    result.fold((l) {
      return emit(state.copywith(movieDetailStates: RequestStates.error,
          movieDetailMessage: l.message));
    }, (r) {
      return emit(state.copywith(
          movieDetail: r, movieDetailStates: RequestStates.loaded));
    });
  }

  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getRecommendaion(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    var result = await getRecommendationUseCase(
        Recommendaionparameters(id: event.id));
    result.fold((l) {
      return emit(state.copywith(recommendationStates: RequestStates.error,
          recommendationMessage: l.message));
    }, (r) {
      print("innnnn");
      print(r[0].backdropPath);
      print(r[1].backdropPath);
      return emit(state.copywith(

          recommendationDetail: r, recommendationStates: RequestStates.loaded));
    });
  }
}