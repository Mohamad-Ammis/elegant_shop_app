import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card.dart';

import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMainPagePadding),
      child: ListView(
        children: [
          CartProductCard(),
        ],
      ),
    );
  }
}
