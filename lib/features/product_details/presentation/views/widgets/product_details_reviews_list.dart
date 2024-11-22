import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_empty_state_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_review_card.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_important_review_list_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsReviewsList extends StatelessWidget {
  const ProductDetailsReviewsList(
      {super.key,
      required this.productDetailsModel,
      required this.productImportantReviewsCubit,
      required this.reviewsCubit,
      required this.productUrl});
  final ProductDetailsModel productDetailsModel;
  final ProductImportantReviewsCubit productImportantReviewsCubit;
  final ProductReviewsCubit reviewsCubit;
  final String productUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: BlocBuilder<ProductImportantReviewsCubit,
          ProductImportantReviewsState>(
        builder: (context, state) {
          return state is ProductImportantReviewsSuccess
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kMainPagePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.verticalSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviews (${productDetailsModel.ratingCount?.toString() ?? '0'})',
                            style: Styles.style20Regular,
                          ),
                          TextButton(
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.all(0),
                              ),
                            ),
                            onPressed: () {
                              context.push(AppRouter.kProductDetailsReviewsView,
                                  extra: {
                                    'product_details_model':
                                        productDetailsModel,
                                    'product_important_reviews_cubit': context
                                        .read<ProductImportantReviewsCubit>(),
                                    'reviews_cubit':
                                        context.read<ProductReviewsCubit>(),
                                  });
                            },
                            child: Text(
                              'See more',
                              style: Styles.style14Regular
                                  .copyWith(color: kSubTitleColor),
                            ),
                          ),
                        ],
                      ),
                      16.verticalSizedBox,
                      state.reviews.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.reviews.length,
                              itemBuilder: (context, index) {
                                return ProductDetailsReviewCard(
                                  productUrl: productUrl,
                                  reviewModel: state.reviews[index],
                                  productImportantReviewsCubit:
                                      productImportantReviewsCubit,
                                  reviewsCubit: reviewsCubit,
                                );
                              },
                            )
                          : const CustomEmptyStateWidget(
                              title:
                                  'Sorry there is no reviews for this product'),
                    ],
                  ),
                )
              : state is ProductImportantReviewsFailure
                  ? CustomErrorWidget(
                      title: state.errMessage,
                      hasRelodButton: true,
                      onTap: () async {
                        await productImportantReviewsCubit
                            .getProductImportantReviews(
                                productUrl: productUrl);
                      },
                    )
                  : const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ProductImportantReviewListShimmerLoading(),
                    );
        },
      ),
    );
  }
}
