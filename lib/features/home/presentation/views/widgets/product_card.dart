import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/data/models/product_model.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      // : const EdgeInsets.fromLTRB(8, 0, 8, 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageSection(product: product),
          8.verticalSizedBox,
          Text(
            overflow: TextOverflow.ellipsis,
            product.name ?? '',
            style: Styles.style14SemiBold,
          ),
          4.verticalSizedBox,
          Text(
            overflow: TextOverflow.ellipsis,
            '${product.category!.name.toString()}',
            style: Styles.style10Regular.copyWith(color: kSubTitleColor),
          ),
          12.verticalSizedBox,
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              product.discount?.active ?? false
                  ? Text.rich(TextSpan(children: [
                      TextSpan(
                          text: r'$'
                              '${product.price.toString()}',
                          style: Styles.style10Regular.copyWith(
                              decoration: TextDecoration.lineThrough)),
                      TextSpan(
                          text: r'  $'
                              '${(product.price!.toDouble() / double.parse(product.discount?.percent ?? '1')).toStringAsFixed(2)}',
                          style: Styles.style12Bold),
                    ]))
                  : Text(
                      r'$' '${product.price.toString()}',
                      style: Styles.style12Bold,
                    ),
              30.horizontalSizedBox,
              Row(
                children: [
                  SvgPicture.asset(Assets.imagesStar),
                  4.horizontalSizedBox,
                  Text(
                    overflow: TextOverflow.ellipsis,
                    product.avgRating != null
                        ? product.avgRating!.toStringAsFixed(1)
                        : '0.0',
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
