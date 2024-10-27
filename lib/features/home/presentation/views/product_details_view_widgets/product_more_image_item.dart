import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class ProductMoreImagesItem extends StatelessWidget {
  const ProductMoreImagesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: kSubTitleColor, width: .5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        Assets.imagesLogin,
        fit: BoxFit.cover,
      ),
    );
  }
}
