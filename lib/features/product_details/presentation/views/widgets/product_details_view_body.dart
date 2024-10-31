import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_image_section.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_info.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_reviews_list.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productDetailsModel});
  final ProductDetailsModel productDetailsModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProductDetailsImageSection(
              productDetailsModel: productDetailsModel,
            ),
          ),
          SliverToBoxAdapter(
            child: ProductDetailsInfo(
              productDetailsModel: productDetailsModel,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.only(bottom: 100),
                child: ProductDetailsReviewsList(productUrl: productDetailsModel.absoluteUrl??'',)),
          ),
        ],
      ),
    );
  }
}
