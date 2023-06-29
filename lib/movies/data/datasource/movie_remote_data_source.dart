import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_clean/core/error/exceptions.dart';
import 'package:movie_clean/core/network/api_constance.dart';
import 'package:movie_clean/core/network/error_model.dart';
import 'package:movie_clean/movies/data/model/movie_details_model.dart';
import 'package:movie_clean/movies/data/model/movie_model.dart';
import 'package:dio/dio.dart';
import 'package:movie_clean/movies/data/model/recommendation_model.dart';
import 'package:movie_clean/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(int id);

  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>> getNowPlayingMovies()async{
    try {
      final response = await Dio().get(ApiConstance.nowPlayingMoviesPath,);
      print("gggg");
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return List<MovieModel>.from(
            (response.data['results'] as List).map((object) =>
                MovieModel.fromJson(object)));
      } else {
        print("kkkk ${response.statusMessage}");
        print("kkkk ${response.statusCode}");
        print(ErrorModel(statusMessage: response.statusMessage!).toString());
        throw ServerException(
            errorModel: ErrorModel(statusMessage: response.statusMessage!)
        );
      }
    }on DioError catch(e){
      print("lolololool");
      print(e.response!.statusCode.toString());
      throw ServerException(
          errorModel: ErrorModel(statusMessage: e.response!.statusMessage!)
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async{
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if(response.statusCode == 200){
      print(response.data);
      return List<MovieModel>.from((response.data['results']).map((object) => MovieModel.fromJson(object)));
    }else{
      throw ServerException(
          errorModel: response.data
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((object) => MovieModel.fromJson(object)));
    }else{
      throw ServerException(
          errorModel: response.data
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async{
    final response = await Dio().get(ApiConstance.movieDetailsPath(id));
    if(response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(
          errorModel: response.data
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async{
    final response = await Dio().get(ApiConstance.recommendationPath(parameters.id));
    if(response.statusCode == 200){
      return List<RecommendationModel>.from((response.data['results'] as List).map((object) => RecommendationModel.fromJson(object)));
    }else{
      throw ServerException(
          errorModel: response.data
      );
    }
  }
}