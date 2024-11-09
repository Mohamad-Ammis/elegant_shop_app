import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_info_header.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_product_card_quantity_section.dart';
import 'package:flutter/material.dart';

class CartProductCardInfo extends StatelessWidget {
  const CartProductCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CartProductCardInfoHeader(),
          4.verticalSizedBox,
          Text(
            'T-Shirt',
            style: Styles.style10Regular.copyWith(color: kSubTitleColor),
          ),
          16.verticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r'212.99$',
                style: Styles.style14SemiBold,
              ),
              const CartProductCardQuantitySection()
            ],
          ),
        ],
      ),
    );
  }
}

