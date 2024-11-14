import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_shipping_inforamtion_item.dart';
import 'package:flutter/material.dart';

class OrderCardInfo extends StatelessWidget {
  const OrderCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingInformationItem(title: 'Total price', subTitle: r'$241.2'),
        6.verticalSizedBox,
        Divider(
          thickness: .2,
          indent: 10,
          endIndent: 10,
        ),
        6.verticalSizedBox,
        ShippingInformationItem(title: 'Order date', subTitle: '08-10-2024'),
      ],
    );
  }
}
