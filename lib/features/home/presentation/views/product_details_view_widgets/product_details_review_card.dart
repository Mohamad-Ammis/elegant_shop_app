
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/presentation/views/product_details_view_widgets/product_details_reviews_rating_icons.dart';
import 'package:flutter/material.dart';

class ProductDetailsReviewCard extends StatelessWidget {
  const ProductDetailsReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(999)),
            width: 60,
            height: 60,
            child: Image.asset(
              Assets.imagesLogin,
              fit: BoxFit.cover,
            ),
          ),
          16.horizontalSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mohamad Ammis',
                      style: Styles.style20Regular,
                    ),
                    const Icon((Icons.more_vert_rounded))
                  ],
                ),
                const ProductDetailsReviewRating(),
                10.verticalSizedBox,
                Text(
                  'Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Read More. . . Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes Read More. . .',
                  style: Styles.style12Regular.copyWith(color: kSubTitleColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
