import 'package:elegant_shop_app/core/functions/get_order_state_color.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:elegant_shop_app/features/orders/presentation/widgets/order_card_header_menu.dart';
import 'package:flutter/material.dart';

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Order #${orderModel.id.toString()}',
          style: Styles.style16Bold,
        ),
        8.horizontalSizedBox,
        Container(
          decoration: BoxDecoration(
              color: getOrderStateColor(orderModel.state.toString()),
              borderRadius: BorderRadius.circular(999)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Text(
            orderModel.state.toString(),
            style: Styles.style12Bold.copyWith(color: Colors.white),
          ),
        ),
        const Spacer(),
        const OrderCardHeaderMenu()
      ],
    );
  }
}
