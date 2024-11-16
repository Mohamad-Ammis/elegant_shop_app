// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:elegant_shop_app/features/orders/data/repo/order_repo.dart';
import 'package:flutter/material.dart';

class OrderRepoImplementation implements OrderRepo {
  List<OrderModel> orders = [];
  final ApiService apiService;
  OrderRepoImplementation({required this.apiService});

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllOrders(
      {int page = 1}) async {
    try {
      bool hasNext = false;
      if (page == 1) {
        orders.clear();
      }
      var response = await apiService.get(
        url: '$kBaseUrl/orders/?page=$page&page_size=$kPaginiationPageSize',
        headers: kCommonApiHeaders,
      );
      for (var i = 0; i < response.data['results'].length; i++) {
        orders.add(OrderModel.fromJson(response.data['results'][i]));
      }
      if (response.data['next'] != null && response.data['next'] != '') {
        hasNext = true;
      } else {
        hasNext = false;
      }
      return Right({'has_next': hasNext, 'orders': orders});
    } catch (e) {
      log('e: $e');
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> cancelOrder(
      {required String orderId, required BuildContext context}) async {
    try {
      var response = await apiService.patch(
          url: '$kBaseUrl/orders/$orderId/cancel/',
          body: {},
          headers: kCommonApiHeaders);
      if (response.statusCode == 200) {
        return const Right(true);
      }
      return const Right(false);
    } catch (e) {
      log('e: $e');
      if (e is DioException) {
        showErrorSnackBar('Error Happened',
                ServerFailure.fromDioException(e).errorMessage)
            .show(context);
        return Left(ServerFailure.fromDioException(e));
      }
      showErrorSnackBar("Error Happened", 'some thing went wrong !').show(context);
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
