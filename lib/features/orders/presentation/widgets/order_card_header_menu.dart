// ignore_for_file: use_build_context_synchronously

import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:elegant_shop_app/features/orders/presentation/helper/order_state_enum.dart';
import 'package:elegant_shop_app/features/orders/presentation/helper/pay_exist_order.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/change_order_model_state.dart/change_order_model_state_cubit.dart';
import 'package:elegant_shop_app/features/orders/presentation/manger/cubit/cancel_exist_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCardHeaderMenu extends StatefulWidget {
  const OrderCardHeaderMenu({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;

  @override
  State<OrderCardHeaderMenu> createState() => _OrderCardHeaderMenuState();
}

class _OrderCardHeaderMenuState extends State<OrderCardHeaderMenu> {
  bool payLoading = false;
  bool cancelLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeOrderModelStateCubit, ChangeOrderModelStateState>(
      builder: (context, state) {
        return orderStateAsEnum(widget.orderModel.state.toString()) ==
                OrderState.pending
            ? GestureDetector(
                onTapDown: (TapDownDetails details) {
                  showMenu(
                    menuPadding: const EdgeInsets.all(0),
                    color: Colors.white,
                    context: context,
                    position: RelativeRect.fromLTRB(
                      details.globalPosition.dx,
                      details.globalPosition.dy,
                      details.globalPosition.dx,
                      details.globalPosition.dy,
                    ),
                    items: [
                      payExistOrderMenuItem(context),
                      cancelExistOrderMenuItem(context),
                    ],
                  );
                },
                child: const Icon(Icons.more_horiz),
              )
            : const SizedBox();
      },
    );
  }

  PopupMenuItem<dynamic> cancelExistOrderMenuItem(BuildContext context) {
    return PopupMenuItem(
      onTap: payLoading || cancelLoading
          ? null
          : () async {
              cancelLoading = true;
              setState(() {});
              bool status = await context
                  .read<CancelExistOrderCubit>()
                  .cancelExistOrder(
                      orderId: widget.orderModel.id.toString(),
                      context: context);
              cancelLoading = false;
              setState(() {});
              if (status) {
                context
                    .read<ChangeOrderModelStateCubit>()
                    .changeOrderModelState(
                        orderModel: widget.orderModel, state: 'cancelled');
              }
            },
      child: cancelLoading
          ? const CustomLoadingWidget(
              size: 25,
            )
          : Row(
              children: [
                const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  'cancel',
                  style: Styles.style14Bold,
                ),
              ],
            ),
    );
  }

  PopupMenuItem<dynamic> payExistOrderMenuItem(BuildContext context) {
    return PopupMenuItem(
      onTap: payLoading || cancelLoading
          ? null
          : () async {
              payLoading = true;
              setState(() {});
              await payExistedOrder(
                  orderModel: widget.orderModel, context: context);
              payLoading = false;
              setState(() {});
            },
      child: payLoading
          ? const CustomLoadingWidget(
              size: 25,
            )
          : Row(
              children: [
                const Icon(
                  Icons.attach_money_sharp,
                  color: Colors.green,
                ),
                const SizedBox(width: 8),
                Text(
                  'Pay',
                  style: Styles.style14Bold,
                ),
              ],
            ),
    );
  }
}
