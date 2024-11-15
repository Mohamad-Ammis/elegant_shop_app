// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/core/utils/stripe_service.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/cubit/change_order_model_state_cubit.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> payExistedOrder(
    {required OrderModel orderModel, required BuildContext context}) async {
  try {
    log('orderModel.clientSecret: ${orderModel.clientSecret}');

    await getIt.get<StripeService>().makePayment(
        customerId: userInfo.getString('customer_id')!,
        clientSecret: orderModel.clientSecret ?? '');
    context
        .read<ChangeOrderModelStateCubit>()
        .changeOrderModelState(orderModel: orderModel, state: 'paid');
  } on Exception catch (e) {
    log('e: $e');
    if (e is DioException) {
      showErrorSnackBar(
              'Payment Error Happened', 'Check your connection or use vpn')
          .show(context);
    } else {
      showErrorSnackBar('Payment Error Happened', 'unexpected error happened')
          .show(context);
    }
  }
}
