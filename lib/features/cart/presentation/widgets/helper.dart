// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/core/utils/stripe_service.dart';
import 'package:elegant_shop_app/features/cart/presentation/mangers/cubit/create_order_cubit.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/create_order_model.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<void> createOrder(BuildContext context, int selectedIndex) async {
  CreateOrderCubit createOrderCubit = context.read<CreateOrderCubit>();
  CreateOrderModel? orderModel =
      await createOrderCubit.createOrder(context: context);
  //cash payment
  if (selectedIndex == 0) {
    handleOrderCashPayment(orderModel, context);
  } else if (selectedIndex == 1 && orderModel != null) {
    await handleOrderCreditCardPayment(orderModel, context);
  }
}

void handleOrderCashPayment(
    CreateOrderModel? orderModel, BuildContext context) {
  log('status: ${orderModel != null}');
  if (orderModel != null) {
    GoRouter.of(context).go(AppRouter.kHomeView);
  }
}

Future<void> handleOrderCreditCardPayment(
    CreateOrderModel orderModel, BuildContext context) async {
  try {
    // GoRouter.of(context).pop();
    await getIt.get<StripeService>().makePayment(
        customerId: userInfo.getString('customer_id')!,
        clientSecret: orderModel.clientSecret ?? '');
    GoRouter.of(context).go(AppRouter.kHomeView);
  } on Exception catch (e) {
    GoRouter.of(context).go(AppRouter.kHomeView);
    if (e is DioException) {
      ElegantNotificationService.showErrorSnackBar(
              'Payment Error Happened', 'Check your connection or use vpn')
          ;
    } else {
      ElegantNotificationService.showErrorSnackBar('Payment Error Happened', 'unexpected error happened')
          ;
    }
  }
}
