
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CartProductCardImage extends StatelessWidget {
  const CartProductCardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        Assets.imagesLogin,
        fit: BoxFit.cover,
        height: 85,
      ),
    ));
  }
}
