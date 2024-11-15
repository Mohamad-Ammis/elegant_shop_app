import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({
    super.key,
    required this.productDetailsModel,
  });
  final ProductDetailsModel productDetailsModel;

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
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.7,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  productDetailsModel.name ?? '',
                  style: Styles.style24SemiBold.copyWith(fontSize: 28),
                ),
              ),
              productDetailsModel.discount?.active ?? false
                  ? Text.rich(TextSpan(children: [
                      TextSpan(
                          text: r'$'
                              '${productDetailsModel.price.toString()}',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough)),
                      TextSpan(
                          text: r'  $'
                              '${(productDetailsModel.price!.toDouble() / double.parse(productDetailsModel.discount?.percent ?? '1')).toStringAsFixed(2)}',
                          style: Styles.style14SemiBold),
                    ]))
                  : Text(
                      r'$' '${productDetailsModel.price.toString()}',
                      style: Styles.style14SemiBold,
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
                  text: productDetailsModel.avgRating == null
                      ? '0.0'
                      : productDetailsModel.avgRating.toString(),
                  style: Styles.style12Regular.copyWith(color: kSubTitleColor),
                ),
              ])),
            ],
          ),
          16.verticalSizedBox,
          ReadMoreText(
            productDetailsModel.description ?? '',
            trimMode: TrimMode.Line,
            trimLines: 5,
            style: Styles.style12Regular.copyWith(color: kSubTitleColor),
            colorClickableText: Colors.pink,
            moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
