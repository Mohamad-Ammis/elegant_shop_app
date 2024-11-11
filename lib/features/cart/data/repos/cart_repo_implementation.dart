// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
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

  @override
  Future<Either<Failure, List<CartProductModel>>> getAllCartProducts() async {
    try {
      List<CartProductModel> cartProducts = [];
      var response = await apiService.get(
          url: '$kBaseUrl/cart/items/', headers: kCommonApiHeaders);
      if (response.statusCode == 200) {
        for (var i = 0; i < response.data.length; i++) {
          cartProducts.add(CartProductModel.fromJson(response.data[i]));
        }
      }
      return Right(cartProducts);
    } catch (e) {
      log('e: $e');
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCartProduct(
      {required String productId, required BuildContext context}) async {
    try {
      var response = await apiService.delete(
          url: '$kBaseUrl/cart/items/$productId/', headers: kCommonApiHeaders);
      if (response.statusCode == 204) {
        return Right(true);
      } else {
        showErrorSnackBar('Error Happened', 'un expected error').show(context);
        return Right(false);
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}