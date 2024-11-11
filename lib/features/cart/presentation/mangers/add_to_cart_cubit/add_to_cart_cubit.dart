import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo.dart';
import 'package:flutter/material.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit({required this.cartRepo}) : super(AddToCartInitial());
  final CartRepo cartRepo;
  Future<bool> addProductToCart(
      {required String productId,
      required String productQuantity,
      required BuildContext context}) async {
    try {
      emit(AddToCartLoading());
      bool status = false;
      var data = await cartRepo.addProductToCart(
          productId: productId,
          productQuantity: productQuantity,
          context: context);
      data.fold((failure) {
        status = false;
        emit(AddToCartFailure());
      }, (success) {
        status = success;
        emit(AddToCartSuccess());
      });
      return status;
    } catch (e) {
      emit(AddToCartFailure());
      log('e: $e');
      return false;
    }
  }
}
