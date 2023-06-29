import 'package:equatable/equatable.dart';
import 'package:movie_clean/core/utils/enums.dart';
import 'package:movie_clean/movies/domain/entities/movie.dart';

class MoviesState extends Equatable{
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies  = const [],
    this.nowPlayingMessage = "",
    this.nowPlayingState   = RequestState.loading,

    this.popularMovies     = const [],
    this.popularMessage    = "",
    this.popularState      = RequestState.loading,

    this.topRatedMovies    = const [],
    this.topRatedMessage   = "",
    this.topRatedState     = RequestState.loading
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,

    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,

    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }){
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.topRatedMessage,

      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.topRatedMessage,

      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,

    popularMovies,
    popularState,
    popularMessage,

    topRatedMovies,
    topRatedState,
    topRatedMessage,
  ];
}