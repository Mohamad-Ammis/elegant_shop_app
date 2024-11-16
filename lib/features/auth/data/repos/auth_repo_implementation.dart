import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/features/auth/data/models/register_input_model.dart';
import 'package:elegant_shop_app/features/auth/data/repos/auth_repo.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';

class AuthRepoImplementation implements AuthRepo {
  final ApiService apiService;

  AuthRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, bool>> signIn(
      {required String userName, required String password}) async {
    try {
      var response = await apiService.post(
          url: '$kBaseUrl/token/login/',
          body: {'username': userName, "password": password},
          contentType: 'application/json',
          headers: {'Accept': 'application/json'});
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        await userInfo.setString('auth_token', response.data['auth_token']);
        await userInfo.setString(
            'user_name', response.data['user']['username']);
        await userInfo.setString('email', response.data['user']['email']);
        await userInfo.setString(
            'avatar', response.data['user']?['avatar'] ?? '');
        await userInfo.setString('customer_id',
            response.data?['user']?['payment_details']?['customer_id'] ?? '');
        return const Right(true);
      } else {
        return const Right(false);
      }
    } on Exception catch (e) {
      log('e: $e');
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(
      {required RegisterInputModel registerInputModel}) async {
    try {
      var response = registerInputModel.image != null &&
              registerInputModel.image!.isNotEmpty
          ? await apiService.postWithImage(
              url: '$kBaseUrl/users/',
              body: registerInputModel.toJson(),
              contentType: 'multipart/form-data',
              headers: {
                'Accept': 'application/json',
              },
              imagePath: registerInputModel.image!)
          : await apiService.post(
              url: '$kBaseUrl/users/',
              body: registerInputModel.toJson(),
              contentType: 'application/json',
              headers: {'Accept': 'application/json'},
            );
      log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } on Exception catch (e) {
      log('e: $e');
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<bool> logOut() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Token ${userInfo.getString('auth_token')}'
      };
      var dio = Dio();
      var response = await dio.request(
        'https://quakstore.onrender.com/api/v1/token/logout/',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
      );
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      } else {
        log(response.statusMessage.toString());
        return false;
      }
    } catch (e) {
      log('e: ${e}');
      if (e is DioException) {
        log(e.response?.data.toString() ?? '');
      }
      return false;
    }
  }
}
