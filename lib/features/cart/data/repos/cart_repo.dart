import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:flutter/material.dart';

abstract class CartRepo {
  Future<Either<Failure, bool>> addProductToCart(
      {required String productId,
      required String productQuantity,
      required BuildContext context});
  Future<Either<Failure, List<CartProductModel>>> getAllCartProducts();
  Future<Either<Failure, bool>> deleteCartProduct(
      {required String productId, required BuildContext context});
  Future<Either<Failure, bool>> updateCartProducts(
      {required List<Map<String, dynamic>> cartProducts,
      required BuildContext context});
}
