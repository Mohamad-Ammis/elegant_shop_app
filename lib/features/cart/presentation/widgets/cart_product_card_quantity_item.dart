
import 'package:elegant_shop_app/constans.dart';
import 'package:flutter/material.dart';

class CartProductCardQuantityItem extends StatelessWidget {
  const CartProductCardQuantityItem({
    super.key, required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffDFDEDE)),
            borderRadius: BorderRadius.circular(999)),
        child:  Icon(
          size: 16,
          icon,
          color: kLightBlackColor,
        ));
  }
}
