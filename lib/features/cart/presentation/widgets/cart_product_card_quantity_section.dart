import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_quantity_item.dart';
import 'package:flutter/material.dart';

class CartProductCardQuantitySection extends StatelessWidget {
  const CartProductCardQuantitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartProductCardQuantityItem(
          icon: Icons.remove,
        ),
        12.horizontalSizedBox,
        const Text('1'),
        12.horizontalSizedBox,
        CartProductCardQuantityItem(
          icon: Icons.add_rounded,
        ),
      ],
    );
  }
}
