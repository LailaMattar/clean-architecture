import 'package:dartz/dartz.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/movies/domain/entities/movie.dart';
import 'package:movie_clean/movies/domain/entities/movie_detail.dart';
import 'package:movie_clean/movies/domain/entities/recommendation.dart';
import 'package:movie_clean/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetail>> getMovieDetails(int parameters);

  Future<Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);
}