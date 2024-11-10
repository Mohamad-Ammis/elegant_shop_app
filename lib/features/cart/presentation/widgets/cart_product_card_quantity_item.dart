import 'package:elegant_shop_app/constans.dart';
import 'package:flutter/material.dart';

class CartProductCardQuantityItem extends StatelessWidget {
  const CartProductCardQuantityItem({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffDFDEDE)),
              borderRadius: BorderRadius.circular(999)),
          child: Icon(
            size: 16,
            icon,
            color: kLightBlackColor,
          )),
    );
  }
}
