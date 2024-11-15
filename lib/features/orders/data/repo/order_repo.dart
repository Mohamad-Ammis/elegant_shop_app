import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:flutter/material.dart';

abstract class OrderRepo {
  Future<Either<Failure, Map<String, dynamic>>> getAllOrders({
    int page = 1,
  });
  Future<Either<Failure, bool>> cancelOrder({
    required String orderId,required BuildContext context
  });

}
