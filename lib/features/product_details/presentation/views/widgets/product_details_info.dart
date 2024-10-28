import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMainPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Light Dress Bless',
                style: Styles.style24SemiBold.copyWith(fontSize: 28),
              ),
              Text(
                r'140$',
                style: Styles.style16SemiBold,
              ),
            ],
          ),
          4.verticalSizedBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.imagesStar),
              4.horizontalSizedBox,
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: '4.8',
                  style: Styles.style12Regular.copyWith(color: kSubTitleColor),
                ),
                TextSpan(
                  text: ' (7932 reviews)',
                  style: Styles.style12Regular.copyWith(color: kSubTitleColor),
                ),
              ])),
            ],
          ),
          16.verticalSizedBox,
          Text(
            'Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Read More. . . Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Read More. . .',
            style: Styles.style12Regular.copyWith(color: kSubTitleColor),
          ),
        ],
      ),
    );
  }
}
