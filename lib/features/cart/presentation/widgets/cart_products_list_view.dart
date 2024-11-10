import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';

class CartProductsListView extends StatelessWidget {
  const CartProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const CartProductCard();
        },
        separatorBuilder: (context, index) => const Divider(
              color: Color(
                0xffDFDEDE,
              ),
              thickness: 0.3,
              indent: 10,
              endIndent: 10,
            ),
        itemCount: 2);
  }
}
