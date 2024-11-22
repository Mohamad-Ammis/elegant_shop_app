
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:flutter/material.dart';

class OrdersShimmerLoadingListView extends StatelessWidget {
  const OrdersShimmerLoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ShimmerContainer(
          width: double.infinity,
          height: 120,
          circularRadius: 16,
          margin:
              EdgeInsets.symmetric(horizontal: kMainPagePadding, vertical: 12),
        );
      },
    );
  }
}
