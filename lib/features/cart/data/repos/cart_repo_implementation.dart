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
        ElegantNotificationService.showSuccessSnackBar('Added Successfully',
            "Product has been added to cart successfully");
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          var data = e.response?.data;
          if ((e.response?.data['product']) != null) {
            ElegantNotificationService.showErrorSnackBar(
                'Error Happened', '${data?['product'][0]}');
          } else if ((data['non_field_errors']) != null) {
            ElegantNotificationService.showErrorSnackBar(
                'Error Happened', '${data?['non_field_errors'][0]}');
          } else if ((data['quantity']) != null) {
            ElegantNotificationService.showErrorSnackBar(
                'Error Happened', '${data?['quantity'][0]}');
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
      log(userInfo.getString('auth_token').toString());
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
      var response = await apiService
          .delete(url: '$kBaseUrl/cart/items/$productId/', headers: {
        "Accept": "application/json",
        "Authorization": "Token ${userInfo.getString('auth_token')}"
      });
      if (response.statusCode == 204) {
        return const Right(true);
      } else {
        ElegantNotificationService.showErrorSnackBar(
            'Error Happened', 'un expected error');
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
      var response = await apiService
          .patch(url: '$kBaseUrl/cart/items/bulk_update/', body: {
        "items": cartProducts
      }, headers: {
        "Accept": "application/json",
        "Authorization": "Token ${userInfo.getString('auth_token')}"
      });
      if (response.statusCode == 200) {
        return const Right(true);
      }
      ElegantNotificationService.showErrorSnackBar(
          'Error Hapened ', 'we can\'t update cart products ! try again ');
      return const Right(false);
    } catch (e) {
      log('e: $e');
      if (e is DioException) {
        ElegantNotificationService.showErrorSnackBar(
            'Error Hapened ', ServerFailure.fromDioException(e).errorMessage);
        return Left(ServerFailure.fromDioException(e));
      }
      ElegantNotificationService.showErrorSnackBar(
          'Error Hapened ', e.toString());
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CreateOrderModel>> createOrder(
      {required BuildContext context}) async {
    try {
      var response =
          await apiService.post(url: '$kBaseUrl/orders/', body: {}, headers: {
        "Accept": "application/json",
        "Authorization": "Token ${userInfo.getString('auth_token')}"
      });
      log('response: ${response.data}');
      if (response.statusCode == 201 || response.statusCode == 200) {
        ElegantNotificationService.showSuccessSnackBar(
            'Order Placed', "Your Order Has been placed Successfully");
      }
      return Right(CreateOrderModel.fromJson(response.data));
    } catch (e) {
      log('e: $e');
      if (e is DioException) {
        ElegantNotificationService.showErrorSnackBar(
            'Error Hapeened', ServerFailure.fromDioException(e).errorMessage);
        return Left(ServerFailure.fromDioException(e));
      }
      ElegantNotificationService.showErrorSnackBar(
          'Error Hapeened', e.toString());
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
