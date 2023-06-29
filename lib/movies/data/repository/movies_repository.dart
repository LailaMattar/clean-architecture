import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movie_clean/core/error/exceptions.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_clean/movies/domain/entities/movie.dart';
import 'package:movie_clean/movies/domain/entities/movie_detail.dart';
import 'package:movie_clean/movies/domain/entities/recommendation.dart';
import 'package:movie_clean/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_clean/movies/domain/usecases/get_recommendation_usecase.dart';

class MovieRepository extends BaseMovieRepository{
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async{
    try{
      final result =await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(result);
    }on ServerException catch (failure){
      print("exceptionnnnn");
      return Left(ServerFailure(message: failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    final result =await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch (failure){
      debugPrint(failure.errorModel.toString());
      return Left(ServerFailure(message: failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    final result =await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(int parameters) async{
    final result =await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    final result =await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorModel.statusMessage));
    }
  }
}