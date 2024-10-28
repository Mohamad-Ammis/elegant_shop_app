import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_review_card.dart';
import 'package:flutter/material.dart';

class ProductDetailsReviewsList extends StatelessWidget {
  const ProductDetailsReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMainPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSizedBox,
          Text(
            'Reviews (7201)',
            style: Styles.style20Regular,
          ),
          16.verticalSizedBox,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ProductDetailsReviewCard();
            },
          ),
        ],
      ),
    );
  }
}
