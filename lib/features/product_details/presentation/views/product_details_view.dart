import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_floating_buy_sections.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: ProductDetailsViewBody(),
    );
  }
}
