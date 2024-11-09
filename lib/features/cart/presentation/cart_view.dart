import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: CartViewBody(),
    );
  }
}