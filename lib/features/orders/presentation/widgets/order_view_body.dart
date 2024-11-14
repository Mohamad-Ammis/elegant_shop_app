import 'package:elegant_shop_app/features/orders/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ListView.builder(
          itemBuilder: (context, index) {
            return OrderCard();
          },
        ))
      ],
    );
  }
}
