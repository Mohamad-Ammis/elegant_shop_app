import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/data/models/cart_product_model/cart_product_model.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_info_header.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_quantity_section.dart';
import 'package:flutter/material.dart';

class CartProductCardInfo extends StatelessWidget {
  const CartProductCardInfo({
    super.key,
    required this.cartProductModel,
    required this.cartProductModelIndex,
  });
  final CartProductModel cartProductModel;
  final int cartProductModelIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartProductCardInfoHeader(
            cartProductModel: cartProductModel,
          ),
          4.verticalSizedBox,
          Text(
            cartProductModel.product!.category.toString(),
            style: Styles.style10Regular.copyWith(color: kSubTitleColor),
          ),
          16.verticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r'$' '${cartProductModel.product!.price.toString()}',
                style: Styles.style14SemiBold,
              ),
              CartProductCardQuantitySection(
                cartProductModelIndex: cartProductModelIndex, cartProductModel: cartProductModel,
              )
            ],
          ),
        ],
      ),
    );
  }
}
