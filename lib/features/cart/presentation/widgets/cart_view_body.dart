import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_products_list_view.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_shipping_information_section.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kMainPagePadding,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: CartProductsListView(),
          ),
          Expanded(
              flex: 2,
              child: CartShippingInforamtionSection())
        ],
      ),
    );
  }
}
