import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/custom_app_bar.dart';
import 'package:elegant_shop_app/features/orders/presentation/widgets/order_view_body.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: CustomAppbar(title: 'My Orders'),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: OrderViewBody(),
      ),
    );
  }
}
