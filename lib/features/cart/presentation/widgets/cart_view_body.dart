import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_products_list_view.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_shipping_information_section.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kMainPagePadding,
      ),
      child: Column(
        children: [
          Expanded(
            child: CartProductsListView(),
            flex: 3,
          ),
          Expanded(
              flex: 2,
              child: CartShippingInforamtionSection())
        ],
      ),
    );
  }
}
