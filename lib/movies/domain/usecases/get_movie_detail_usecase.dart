import 'package:dartz/dartz.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/core/usecase/base_usecase.dart';
import 'package:movie_clean/movies/domain/entities/movie_detail.dart';
import 'package:movie_clean/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail,int>{
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(int parameters) async{
    return await baseMovieRepository.getMovieDetails(parameters);
  }

}