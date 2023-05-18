part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {



  final MovieDetail? movieDetail;
  final RequestStates movieDetailStates;
  final String movieDetailMessage;


  final List<Recommendation> recommendationDetail;
  final RequestStates recommendationStates;
  final String recommendationMessage;

 const MovieDetailsState(

     {
        this.movieDetail,
       this.movieDetailStates=RequestStates.loading,
       this.movieDetailMessage="",
       this.recommendationDetail=const[],
       this.recommendationStates=RequestStates.loading,
       this.recommendationMessage="",
     });

  MovieDetailsState copywith(
      {
      MovieDetail? movieDetail,
      RequestStates? movieDetailStates,
      String? movieDetailMessage,
         List<Recommendation>? recommendationDetail,
         RequestStates? recommendationStates,
         String? recommendationMessage,

}
)=> MovieDetailsState(movieDetail: movieDetail?? this.movieDetail,
    movieDetailStates: movieDetailStates?? this.movieDetailStates,
      movieDetailMessage: movieDetailMessage?? this.movieDetailMessage,
  recommendationDetail:recommendationDetail??this.recommendationDetail,
    recommendationStates: recommendationStates?? this.recommendationStates,
    recommendationMessage: recommendationMessage?? this.recommendationMessage,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [movieDetail,movieDetailMessage,movieDetailStates,recommendationMessage,recommendationStates,recommendationDetail];

}

