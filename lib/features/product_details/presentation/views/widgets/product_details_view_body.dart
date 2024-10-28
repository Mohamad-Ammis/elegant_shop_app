import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_image_section.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_info.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_reviews_list.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProductDetailsImageSection(),
          ),
          SliverToBoxAdapter(
            child: ProductDetailsInfo(),
          ),
          SliverToBoxAdapter(
            child: ProductDetailsReviewsList(),
          ),
        ],
      ),
    );
  }
}
