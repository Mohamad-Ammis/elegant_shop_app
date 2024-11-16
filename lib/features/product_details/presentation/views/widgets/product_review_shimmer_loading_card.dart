import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:flutter/material.dart';

class ProductReviewShimmerLoadingCard extends StatelessWidget {
  const ProductReviewShimmerLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(
            width: 50,
            height: 50,
            circularRadius: 999,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          // 8.horizontalSizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerContainer(
                width: MediaQuery.sizeOf(context).width * .3,
                height: 20,
                circularRadius: 16,
              ),
              8.verticalSizedBox,
              ShimmerContainer(
                width: MediaQuery.sizeOf(context).width * .5,
                height: 20,
                circularRadius: 16,
              ),
              8.verticalSizedBox,
              ShimmerContainer(
                width: MediaQuery.sizeOf(context).width * .5,
                height: 20,
                circularRadius: 16,
              )
            ],
          )
        ],
      ),
    );
  }
}
