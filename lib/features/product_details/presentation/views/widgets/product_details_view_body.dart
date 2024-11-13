import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_image_section.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_info.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_reviews_list.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody(
      {super.key,
      required this.productDetailsModel,
      required this.productImportantReviewsCubit,
      required this.reviewsCubit});
  final ProductDetailsModel productDetailsModel;
  final ProductImportantReviewsCubit productImportantReviewsCubit;
  final ProductReviewsCubit reviewsCubit;
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
                margin: const EdgeInsets.only(bottom: 100),
                child: ProductDetailsReviewsList(
                  productDetailsModel: productDetailsModel,
                  productImportantReviewsCubit: productImportantReviewsCubit,
                  reviewsCubit: reviewsCubit,
                  productUrl: productDetailsModel.absoluteUrl!,
                )),
          ),
        ],
      ),
    );
  }
}
