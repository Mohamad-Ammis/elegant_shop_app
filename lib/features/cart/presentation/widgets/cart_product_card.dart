import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_image.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_info.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CartProductCardImage(),
          16.horizontalSizedBox,
          const CartProductCardInfo()
        ],
      ),
    );
  }
}

