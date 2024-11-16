import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_review_shimmer_loading_card.dart';
import 'package:flutter/material.dart';

class ProductImportantReviewListShimmerLoading extends StatelessWidget {
  const ProductImportantReviewListShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.verticalSizedBox,
        ShimmerContainer(
          width: 120,
          height: 20,
          circularRadius: 16,
          margin: EdgeInsets.symmetric(horizontal: kMainPagePadding),
        ),
        24.verticalSizedBox,
        ProductReviewShimmerLoadingCard(),
        ProductReviewShimmerLoadingCard(),
        ProductReviewShimmerLoadingCard(),
        ProductReviewShimmerLoadingCard(),
      ],
    );
  }
}
