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
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/create_order_model.dart';
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
      log('${userInfo.getString('auth_token').toString()}');
      var response =
          await apiService.get(url: '$kBaseUrl/cart/items/', headers: {
        "Accept": "application/json",
        "Authorization": "Token ${userInfo.getString('auth_token')}"
      });
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
          url: '$kBaseUrl/cart/items/$productId/',headers: {
            "Accept": "application/json",
            "Authorization": "Token ${userInfo.getString('auth_token')}"
          });
      if (response.statusCode == 204) {
        return const Right(true);
      } else {
        showErrorSnackBar('Error Happened', 'un expected error').show(context);
        return const Right(false);
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateCartProducts(
      {required List<Map<String, dynamic>> cartProducts,
      required BuildContext context}) async {
    try {
      var response = await apiService.patch(
          url: '$kBaseUrl/cart/items/bulk_update/',
          body: {"items": cartProducts},
         headers: {
            "Accept": "application/json",
            "Authorization": "Token ${userInfo.getString('auth_token')}"
          });
      log(response.data.toString());
      if (response.statusCode == 200) {
        return const Right(true);
      }
      showErrorSnackBar(
              'Error Hapened ', 'we can\'t update cart products ! try again ')
          .show(context);
      return const Right(false);
    } catch (e) {
      log('e: $e');
      if (e is DioException) {
        showErrorSnackBar('Error Hapened ',
                ServerFailure.fromDioException(e).errorMessage)
            .show(context);
        return Left(ServerFailure.fromDioException(e));
      }
      showErrorSnackBar('Error Hapened ', e.toString()).show(context);
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateOrderModel>> createOrder(
      {required BuildContext context}) async {
    try {
      var response = await apiService.post(
          url: '$kBaseUrl/orders/', body: {},headers: {
            "Accept": "application/json",
            "Authorization": "Token ${userInfo.getString('auth_token')}"
          });
      log('response: ${response.data}');
      if (response.statusCode == 201 || response.statusCode == 200) {
        showSuccesSnackBar(
                'Order Placed', "Your Order Has been placed Successfully")
            .show(context);
      }
      return Right(CreateOrderModel.fromJson(response.data));
    } catch (e) {
      log('e: $e');
      if (e is DioException) {
        showErrorSnackBar('Error Hapeened',
                ServerFailure.fromDioException(e).errorMessage)
            .show(context);
        return Left(ServerFailure.fromDioException(e));
      }
      showErrorSnackBar('Error Hapeened', e.toString()).show(context);
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
