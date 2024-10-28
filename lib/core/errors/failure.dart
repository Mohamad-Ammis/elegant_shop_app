import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
    // التحقق من نوع الكود ورسالته بناءً على الاستجابة
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      try {
        return ServerFailure(
            errorMessage: response['details'] ?? 'Authorization error');
      } catch (e) {
        debugPrint('Error parsing response: ${e.toString()}');
        return ServerFailure(errorMessage: 'Authorization error');
      }
    } else if (statusCode == 404) {
      return ServerFailure(errorMessage: "Request not found");
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: "Internal Server Error, please try again later!");
    } else {
      return ServerFailure(
          errorMessage:
              "Oops! An unexpected error occurred, please try again.");
    }
  }
}
