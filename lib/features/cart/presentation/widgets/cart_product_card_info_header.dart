import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:flutter/material.dart';

class CartProductCardInfoHeader extends StatelessWidget {
  const CartProductCardInfoHeader({
    super.key,
    required this.cartProductModel,
  });
  final CartProductModel cartProductModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 2.5,
          child: Text(
            overflow: TextOverflow.ellipsis,
            cartProductModel.product!.name ?? '',
            style: Styles.style14SemiBold,
          ),
        ),
        const Icon(Icons.more_horiz)
      ],
    );
  }
}
