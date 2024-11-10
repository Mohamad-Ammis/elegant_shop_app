import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_quantity_item.dart';
import 'package:flutter/material.dart';

class CartProductCardQuantitySection extends StatefulWidget {
  const CartProductCardQuantitySection({
    super.key,
  });

  @override
  State<CartProductCardQuantitySection> createState() =>
      _CartProductCardQuantitySectionState();
}

class _CartProductCardQuantitySectionState
    extends State<CartProductCardQuantitySection> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartProductCardQuantityItem(
          icon: Icons.remove,
          onTap: () {
            if (count > 1) {
              count--;
              setState(() {});
            }
          },
        ),
        12.horizontalSizedBox,
        Text(count.toString()),
        12.horizontalSizedBox,
        CartProductCardQuantityItem(
          icon: Icons.add_rounded,
          onTap: () {
            count++;
            setState(() {});
          },
        ),
      ],
    );
  }
}
