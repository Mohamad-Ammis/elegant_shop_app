import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/custom_app_bar.dart';
import 'package:elegant_shop_app/features/home/presentation/views/category_products_view_widgets/category_products_view_body.dart';
import 'package:flutter/material.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView(
      {super.key, required this.categoryName, required this.categoryApiUrl});
  final String categoryName;
  final String categoryApiUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: CustomAppbar(title: '$categoryName products'),
        body: CategoryProductsViewBody(
          categoryApiUrl: categoryApiUrl,
        ));
  }
}
