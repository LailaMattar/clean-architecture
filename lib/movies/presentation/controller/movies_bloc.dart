import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movie_clean/core/usecase/base_usecase.dart';
import 'package:movie_clean/core/utils/enums.dart';
import 'package:movie_clean/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_clean/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_clean/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/movies_event.dart';
import 'package:movie_clean/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
      this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase
      ):super(const MoviesState()){
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: r,
        ))
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        ))
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        )),
            (r) => emit(state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        ))
    );
  }
}