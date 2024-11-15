import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/features/orders/data/repo/order_repo.dart';
import 'package:flutter/material.dart';

part 'cancel_exist_order_state.dart';

class CancelExistOrderCubit extends Cubit<CancelExistOrderState> {
  CancelExistOrderCubit({required this.orderRepo})
      : super(CancelExistOrderInitial());
  final OrderRepo orderRepo;
  Future<bool> cancelExistOrder(
      {required String orderId, required BuildContext context}) async {
    try {
      emit(CancelExistOrderLoading());
      bool status = false;
      var result =
          await orderRepo.cancelOrder(orderId: orderId, context: context);
      result.fold((failure) {
        emit(CancelExistOrderFailure());
      }, (data) {
        status = data;
        if (data) {
          emit(CancelExistOrderSuccess());
        } else
          emit(CancelExistOrderFailure());
      });
      return status;
    } catch (e) {
      log('e: ${e}');
      return false;
    }
  }
}
