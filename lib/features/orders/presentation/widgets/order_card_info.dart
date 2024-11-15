import 'package:elegant_shop_app/core/functions/format_date.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_shipping_inforamtion_item.dart';
import 'package:elegant_shop_app/features/orders/data/models/create_order_model/order.dart';
import 'package:flutter/material.dart';

class OrderCardInfo extends StatelessWidget {
  const OrderCardInfo({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingInformationItem(
            title: 'Total price',
            subTitle: r'$' '${orderModel.total?.toString() ?? 'ammis'}'),
        6.verticalSizedBox,
        const Divider(
          thickness: .2,
          indent: 10,
          endIndent: 10,
        ),
        6.verticalSizedBox,
        ShippingInformationItem(
            title: 'Order date',
            subTitle:
                formatDate(orderModel.dateAdded.toString().substring(0, 10)).toString()),
      ],
    );
  }
}
