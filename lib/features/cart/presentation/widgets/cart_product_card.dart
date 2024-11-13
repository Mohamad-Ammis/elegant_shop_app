import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_image.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_info.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.cartProductModel, required this.cartProductModelIndex,
  });
  final CartProductModel cartProductModel;
  final int cartProductModelIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartProductCardImage(
            cartProductModel: cartProductModel,
          ),
          16.horizontalSizedBox,
          CartProductCardInfo(
            cartProductModel: cartProductModel, cartProductModelIndex: cartProductModelIndex,
          )
        ],
      ),
    );
  }
}
