import 'dart:developer';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    // تحقق من أن response ليس null وتسجيل تفاصيل الخطأ في السجل
    log(dioException.response?.data?.toString() ?? 'Response is null');

    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: 'Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad Certificate with API server');
      case DioExceptionType.badResponse:
        // التحقق من وجود `response` و`statusCode` قبل الوصول إليهما
        if (dioException.response != null &&
            dioException.response!.statusCode != null) {
          return ServerFailure.fromResponse(
              dioException.response!.statusCode!, dioException.response!.data);
        }
        return ServerFailure(
            errorMessage: 'Received invalid response from server');
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'Connection error with API server');
      case DioExceptionType.unknown:
        // تحقق من أن الرسالة تحتوي على 'SocketException' للإشارة إلى انقطاع الإنترنت
        if (dioException.message != null &&
            dioException.message!.contains('SocketException')) {
          return ServerFailure(errorMessage: 'No Internet Connection');
        }
        return ServerFailure(
            errorMessage: 'Unexpected Error, please try again');
      default:
        return ServerFailure(
            errorMessage: 'Unexpected Error, please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    String errorMessage;

    // تحقق مما إذا كانت الاستجابة عبارة عن خريطة (Map) تمثل JSON
    if (response is Map<String, dynamic>) {
      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        errorMessage = response['details'] ?? 'Authorization error';
      } else if (statusCode == 404) {
        errorMessage = "Request not found";
      } else if (statusCode == 500) {
        errorMessage = "Internal Server Error, please try again later!";
      } else {
        errorMessage = "Oops! An unexpected error occurred, please try again.";
      }
    } else if (response is String) {
      // إذا كانت الاستجابة نصية (مثل HTML)، قم بإرجاع رسالة توضح ذلك
      errorMessage = "Received unexpected response format from server.";
    } else {
      // إذا كانت الاستجابة ليست JSON ولا نصية، أعد رسالة خطأ عامة
      errorMessage = "An error occurred, please try again later.";
    }

    return ServerFailure(errorMessage: errorMessage);
  }
}
