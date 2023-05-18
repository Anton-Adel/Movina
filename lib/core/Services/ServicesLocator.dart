
import 'package:get_it/get_it.dart';
import 'package:movina/moves/data/dataSource/Movie_remote_data_source.dart';
import 'package:movina/moves/data/repository/movies_repository.dart';
import 'package:movina/moves/domain/repository/base_movies_repository.dart';
import 'package:movina/moves/domain/usecase/get_movie_details_usecase.dart';
import 'package:movina/moves/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movina/moves/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movina/moves/domain/usecase/get_recommendation_usecase.dart';
import 'package:movina/moves/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movina/moves/presentation/controller/Movies_Bloc.dart';
import 'package:movina/moves/presentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator {
  void init(){

    /// MovieBLoc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    //UseCase
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetMovieDetialUseCase>(() => GetMovieDetialUseCase( baseMoviesRepository: sl()));
    sl.registerLazySingleton<GetRecommendationUseCase>(() => GetRecommendationUseCase(sl()));


    //Movie Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
    //Data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }

}