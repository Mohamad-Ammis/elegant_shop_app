import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/create_order_model.dart';
import 'package:flutter/material.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit({required this.cartRepo}) : super(CreateOrderInitial());
  final CartRepo cartRepo;
  Future<CreateOrderModel?> createOrder({required BuildContext context}) async {
    CreateOrderModel? orderModel;
    try {
      try {
        emit(CreateOrderLoading());
        var result = await cartRepo.createOrder(context: context);
        result.fold((failure) {
          emit(CreateOrderFailure());
        }, (data) {
          orderModel = data;
          emit(CreateOrderSuccess(orderModel: data));
        });
        return orderModel;
      } on Exception catch (e) {
        log('e: $e');
        emit(CreateOrderFailure());
        return orderModel;
      }
    } on StateError catch (e) {
      log('e: $e');
      return orderModel;
    }
  }
}
