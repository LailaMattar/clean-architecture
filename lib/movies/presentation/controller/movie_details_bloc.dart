import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean/core/utils/enums.dart';
import 'package:movie_clean/movies/domain/entities/movie_detail.dart';
import 'package:movie_clean/movies/domain/entities/recommendation.dart';
import 'package:movie_clean/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie_clean/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailUseCase,this.getRecommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMoviesRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getMovieDetailUseCase(event.id);

    result.fold(
            (l)=>emit(state.copyWith(
                movieDetailsState: RequestState.error,
                movieDetailsMessage: l.message
            )),
            (r)=>emit(state.copyWith(
                movieDetailsState: RequestState.loaded,
                movieDetail: r
            )),
    );
  }

  FutureOr<void> _getRecommendation(
      GetMoviesRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getRecommendationUseCase(RecommendationParameters(event.id));

    result.fold(
          (l)=>emit(state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message
      )),
          (r)=>emit(state.copyWith(
          recommendationState: RequestState.loaded,
          recommendation: r
      )),
    );
  }
}
