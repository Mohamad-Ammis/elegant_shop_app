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
          Text(
            'Light Dress Bless',
            style: Styles.style24SemiBold.copyWith(fontSize: 28),
          ),
          4.verticalSizedBox,
          Row(
            children: [
              SvgPicture.asset(Assets.imagesStar),
              8.horizontalSizedBox,
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: '4.8',
                  style: Styles.style12Regular.copyWith(color: kSubTitleColor),
                ),
                TextSpan(
                  text: ' (7932 reviews)',
                  style:
                      Styles.style12Regular.copyWith(color: Color(0xff347EFB)),
                ),
              ])),
            ],
          ),
          16.verticalSizedBox,
          Text(
            'https://www.google.com/search?client=firefox-b-d&sca_esv=b4809427600e83a5&sxsrf=ADLYWIKS8abu2VwLqkMv2dQru7r70wUQaA:1730059488734&q=products+review+ui&udm=2&fbs=AEQNm0CrHVBV9axs7YmgJiq-TjYc7RgyMjmhctvLCnk5YpVfOzTk9UgrCkq1LL6wECoQ_WGpuh2-yvh4a1uIS1ER30dB5AWZ8RxNjUsmzFd4N_UT1oUNZfs4C3G8xLBj8dMjxnxwyU-UJN99U7fNsRI-pWnVE5KFVJFgLI_Oh0CZhjHwc1W0HeIrcIvNwyjxFJw-UaUn9lCRGxP3O_xa89hyqWrDJSrVcw&sa=X&ved=2ahUKEwihq5Dqra-JAxUmia8BHajqAQIQtKgLegQIExAB',
            style: Styles.style12Regular.copyWith(color: kSubTitleColor),
          ),
        ],
      ),
    );
  }
}
