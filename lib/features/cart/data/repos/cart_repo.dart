import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:flutter/material.dart';

abstract class CartRepo {
  Future<Either<Failure, bool>> addProductToCart(
      {required String productId, required String productQuantity,required BuildContext context});
}
