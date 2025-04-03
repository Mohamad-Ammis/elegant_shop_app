// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/core/utils/stripe_service.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/change_order_model_state.dart/change_order_model_state_cubit.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pay_exist_order_state.dart';

class PayExistOrderCubit extends Cubit<PayExistOrderState> {
  PayExistOrderCubit() : super(PayExistOrderInitial());

  Future<void> payExistedOrder(
      {required OrderModel orderModel, required BuildContext context}) async {
    try {
  try {
    emit(PayExistOrderLoading());
    await getIt.get<StripeService>().makePayment(
        customerId: userInfo.getString('customer_id')!,
        clientSecret: orderModel.clientSecret ?? '');
    context
        .read<ChangeOrderModelStateCubit>()
        .changeOrderModelState(orderModel: orderModel, state: 'paid');
    emit(PayExistOrderSuccess());
  } on Exception catch (e) {
    log('e: $e');
    emit(PayExistOrderFailure());
    if (e is DioException) {
      ElegantNotificationService.showErrorSnackBar(
              'Payment Error Happened', 'Check your connection or use vpn')
          ;
    } else {
      ElegantNotificationService.showErrorSnackBar('Payment Error Happened', 'unexpected error happened')
          ;
    }
  }
} on StateError catch (e) {
  log('e: $e');

}
  }
}
