
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:flutter/material.dart';

class CategoryLoadingShimmerListView extends StatelessWidget {
  const CategoryLoadingShimmerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const ShimmerContainer(
              width: 60,
              height: 30,
              circularRadius: 16,
              margin: EdgeInsets.only(right: 8),
            );
          }),
    );
  }
}
