import 'package:elegant_shop_app/features/orders/presentation/widgets/orders_list_view.dart';
import 'package:flutter/material.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: OrdersListView())
      ],
    );
  }
}
