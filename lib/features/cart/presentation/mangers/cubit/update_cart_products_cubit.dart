import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'update_cart_products_state.dart';

class UpdateCartProductsCubit extends Cubit<UpdateCartProductsState> {
  UpdateCartProductsCubit({required this.cartRepo})
      : super(UpdateCartProductsInitial());
  final CartRepo cartRepo;
  Future<bool> updateCartProducts(
      {required List<Map<String, dynamic>> cartProducts,
      required BuildContext context}) async {
    try {
      emit(UpdateCartProductsLoading());
      bool status = false;
      var result = await cartRepo.updateCartProducts(
          cartProducts: cartProducts, context: context);
      result.fold((failure) {
        emit(UpdateCartProductsFailure(errMessage: failure.errorMessage));
      }, (data) {
        if (data) {
          emit(UpdateCartProductsSuccess());
          status = true;
        } else {
          emit(UpdateCartProductsFailure(errMessage: 'unexpected errro'));
          status = false;
        }
      });
      return status;
    } catch (e) {
      log('e: ${e}');
      return false;
    }
  }

  List<Map<String, dynamic>> handleCartProductsAsJson(
      List<CartProductModel> cartProducts) {
    List<Map<String, dynamic>> data = [];
    for (var i = 0; i < cartProducts.length; i++) {
      data.add({
        'id': cartProducts[i].id.toString(),
        "quantity": cartProducts[i].quantity.toString()
      });
    }
    log('cart product as json  : ${data}');
    return data;
  }
}
