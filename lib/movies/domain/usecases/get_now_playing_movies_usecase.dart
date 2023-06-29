import 'package:dartz/dartz.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/core/usecase/base_usecase.dart';
import 'package:movie_clean/movies/domain/entities/movie.dart';
import 'package:movie_clean/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameters)async{
    return await baseMovieRepository.getNowPlayingMovies();
  }
}