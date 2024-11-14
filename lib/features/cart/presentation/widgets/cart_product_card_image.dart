import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_cached_network_image.dart';
import 'package:flutter/material.dart';

class CartProductCardImage extends StatelessWidget {
  const CartProductCardImage({
    super.key,
    required this.cartProductModel,
  });
  final CartProductModel cartProductModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: cartProductModel.product?.discount?.active ?? false
          ? Banner(
              message:
                  '${cartProductModel.product?.discount!.percent.toString()}%',
              location: BannerLocation.topStart,
              child: CartProductCardCashedNetworkImage(
                cartProductModel: cartProductModel,
              ),
            )
          : CartProductCardCashedNetworkImage(
              cartProductModel: cartProductModel,
            ),
    ));
  }
}
