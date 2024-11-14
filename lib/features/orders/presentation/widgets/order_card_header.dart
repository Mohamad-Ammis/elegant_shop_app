import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/orders/presentation/widgets/order_card_header_menu.dart';
import 'package:flutter/material.dart';

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Order #12314',
          style: Styles.style16Bold,
        ),
        8.horizontalSizedBox,
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(999)),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Text(
            'Paid',
            style: Styles.style12Bold.copyWith(color: Colors.white),
          ),
        ),
        Spacer(),
        OrderCardHeaderMenu()
      ],
    );
  }
}
