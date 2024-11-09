import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class CartProductCardQuantitySection extends StatelessWidget {
  const CartProductCardQuantitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffDFDEDE)),
                borderRadius: BorderRadius.circular(999)),
            child: const Icon(
              size: 16,
              Icons.remove,
              color: kLightBlackColor,
            )),
        12.horizontalSizedBox,
        const Text('1'),
        12.horizontalSizedBox,
        Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffDFDEDE)),
                borderRadius: BorderRadius.circular(999)),
            child: const Icon(
              Icons.add_rounded,
              size: 16,
              color: kLightBlackColor,
            )),
      ],
    );
  }
}

