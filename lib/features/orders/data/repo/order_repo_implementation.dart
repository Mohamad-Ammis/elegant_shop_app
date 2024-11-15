import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:elegant_shop_app/features/orders/data/repo/order_repo.dart';

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
}
