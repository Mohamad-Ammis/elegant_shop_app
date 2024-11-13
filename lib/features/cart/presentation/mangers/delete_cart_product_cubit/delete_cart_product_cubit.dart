import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo.dart';
import 'package:flutter/material.dart';

part 'delete_cart_product_state.dart';

class DeleteCartProductCubit extends Cubit<DeleteCartProductState> {
  DeleteCartProductCubit({required this.cartRepo})
      : super(DeleteCartProductInitial());
  final CartRepo cartRepo;
  Future<bool> deleteCartProduct(
      {required String productId, required BuildContext context}) async {
    try {
      emit(DeleteCartProductLoading());
      var status = false;
      var data = await cartRepo.deleteCartProduct(
          productId: productId, context: context);
      data.fold((failure) {
        log(failure.errorMessage);
        emit(DeleteCartProductFailure());
      }, (right) {
        status = right;
        emit(DeleteCartProductSuccess());
      });
      return status;
    } catch (e) {
      log('e: ${e}');
      emit(DeleteCartProductFailure());
      return false;
    }
  }
}
