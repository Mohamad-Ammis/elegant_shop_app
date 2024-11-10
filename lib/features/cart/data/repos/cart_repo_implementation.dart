// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';

class CartRepoImplementation implements CartRepo {
  final ApiService apiService;

  CartRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, bool>> addProductToCart(
      {required String productId,
      required String productQuantity,
      required BuildContext context}) async {
    try {
      var response = await apiService.post(url: '$kBaseUrl/cart/items/', body: {
        "product": productId,
        "quantity": productQuantity
      }, headers: {
        "Accept": 'application/json',
        "Authorization": "Token ${userInfo.getString('auth_token')}"
      });
      if (response.statusCode == 201) {
        showSuccesSnackBar('Added Successfully',
                "Product has been added to cart successfully")
            .show(context);
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          var data = e.response?.data;
          if ((e.response?.data['product']) != null) {
            showErrorSnackBar('Error Happened', '${data?['product'][0]}')
                .show(context);
          } else if ((data['non_field_errors']) != null) {
            showErrorSnackBar(
                    'Error Happened', '${data?['non_field_errors'][0]}')
                .show(context);
          } else if ((data['quantity']) != null) {
            showErrorSnackBar('Error Happened', '${data?['quantity'][0]}')
                .show(context);
          }
        }
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
