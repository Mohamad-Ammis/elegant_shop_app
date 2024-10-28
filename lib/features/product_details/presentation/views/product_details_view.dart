import 'package:dio/dio.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo_implementation.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_floating_buy_sections.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  ProductDetailsRepoImplementation test =
      ProductDetailsRepoImplementation(apiService: ApiService(dio: Dio()));
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await test.getProductsInfo(
          productUrl: 'https://quakstore.onrender.com/api/v1/products/1/102/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: ProductDetailsViewBody(),
    );
  }
}
