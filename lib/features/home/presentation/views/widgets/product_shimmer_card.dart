import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:flutter/material.dart';

class ProductShimmerCard extends StatelessWidget {
  const ProductShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: ShimmerContainer(
              width: double.infinity, height: 250, circularRadius: 16),
        ),
        8.verticalSizedBox,
        const ShimmerContainer(width: 100, height: 20, circularRadius: 16),
        8.verticalSizedBox,
        const ShimmerContainer(width: 50, height: 20, circularRadius: 16),
        8.verticalSizedBox,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerContainer(width: 50, height: 20, circularRadius: 16),
            ShimmerContainer(width: 50, height: 20, circularRadius: 16),
            SizedBox(
              width: 10,
            )
          ],
        )
      ],
    );
  }
}
