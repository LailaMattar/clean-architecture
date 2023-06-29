import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable{
  // final int statusCode;
  final String statusMessage;
  // final bool success;

  const ErrorModel({
    // required this.statusCode,
    required this.statusMessage,
    // required this.success
  });

  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'ErrorModel{statusMessage: $statusMessage}';
  }

// @override
  // String toString() {
  //   return 'ErrorModel{\nstatusCode: $statusCode, \nstatusMessage: $statusMessage, \nsuccess: $success}';
  // }
}