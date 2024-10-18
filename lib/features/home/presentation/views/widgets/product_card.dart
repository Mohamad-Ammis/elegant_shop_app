import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                width: double.infinity,
                Assets.imagesProduct1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          8.verticalSizedBox,
          Text(
            'Modern Light Clothes',
            style: Styles.style14SemiBold,
          ),
          4.verticalSizedBox,
          Text(
            'T-Shirt',
            style: Styles.style10Regular.copyWith(color: kSubTitleColor),
          ),
          12.verticalSizedBox,
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r'$212.99',
                style: Styles.style14Bold,
              ),
              40.horizontalSizedBox,
              Row(
                children: [
                  SvgPicture.asset(Assets.imagesStar),
                  4.horizontalSizedBox,
                  Text(
                    '5.0',
                    style: Styles.style12Regular,
                  ),
                ],
              )
            ],
          ),
          8.verticalSizedBox
        ],
      ),
    );
  }
}
