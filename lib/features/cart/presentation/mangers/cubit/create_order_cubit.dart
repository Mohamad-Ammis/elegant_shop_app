import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo.dart';
import 'package:elegant_shop_app/features/orders/data/models/order_model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit({required this.cartRepo}) : super(CreateOrderInitial());
  final CartRepo cartRepo;
  Future<OrderModel?> createOrder({required BuildContext context}) async {
        OrderModel? orderModel;
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
        log('e: ${e}');
        emit(CreateOrderFailure());
        return orderModel;
      }
    } on StateError catch (e) {
      log('e: $e');
      return orderModel;
    }
  }
}
