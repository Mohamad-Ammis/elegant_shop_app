import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/product_reviews_view_widgets/product_reviews_list_view.dart';
import 'package:flutter/material.dart';

class ProductReviewsViewBody extends StatelessWidget {
  const ProductReviewsViewBody({super.key, required this.productUrl});
  final String productUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMainPagePadding),
      child: ProductReviewsListView(
        productUrl: productUrl,
      ),
    );
  }
}
