import 'package:movie_clean/core/network/error_model.dart';

class ServerException implements Exception{
  final ErrorModel errorModel;

  const ServerException({
    required this.errorModel
  });
}