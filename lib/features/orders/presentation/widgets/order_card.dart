import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:elegant_shop_app/features/orders/presentation/widgets/order_card_header.dart';
import 'package:elegant_shop_app/features/orders/presentation/widgets/order_card_info.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(.08))
      ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              OrderCardHeader(orderModel: orderModel,),
              20.verticalSizedBox,
              OrderCardInfo(
                orderModel: orderModel,
              ),
            ],
          ),
          // 8.verticalSizedBox
        ],
      ),
    );
  }
}
