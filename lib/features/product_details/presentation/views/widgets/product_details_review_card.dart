// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/utils/shimmer_custom_container.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_model/review_model.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/cubit/delete_product_review_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_reviews_rating_icons.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsReviewCard extends StatelessWidget {
  const ProductDetailsReviewCard({
    super.key,
    required this.reviewModel,
    required this.productImportantReviewsCubit,
    required this.reviewsCubit,
    required this.productUrl,
  });
  final ReviewModel reviewModel;
  final ProductImportantReviewsCubit productImportantReviewsCubit;
  final ProductReviewsCubit reviewsCubit;
  final String productUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(999)),
              width: 60,
              height: 60,
              child: reviewModel.user?.avatar == null
                  ? Image.asset(Assets.imagesPers)
                  : CachedNetworkImage(
                      imageUrl: reviewModel.user?.avatar ?? '',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const ShimmerContainer(
                        width: double.infinity,
                        height: double.infinity,
                        circularRadius: 999,
                      ),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    )),
          16.horizontalSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        reviewModel.user?.username ?? 'Anonymous User',
                        style: Styles.style20Regular,
                      ),
                    ),
                    reviewModel.user!.username.toString() ==
                            userInfo.getString('user_name')
                        ? BlocBuilder<DeleteProductReviewCubit,
                            DeleteProductReviewState>(
                            builder: (context, state) {
                              return PopupMenuButton<int>(
                                color: Colors.white,
                                onSelected: state is DeleteProductReviewLoading
                                    ? null
                                    : (value) async {
                                        if (value == 1) {
                                          if (state
                                              is! DeleteProductReviewLoading) {
                                            bool status = await BlocProvider.of<
                                                        DeleteProductReviewCubit>(
                                                    context)
                                                .deleteProductReview(
                                                    productUrl: productUrl,
                                                    reviewId: reviewModel.id
                                                        .toString());

                                            log('status: $status');
                                            if (status) {
                                              context
                                                  .read<ProductReviewsCubit>()
                                                  .page = 1;
                                              await context
                                                  .read<ProductReviewsCubit>()
                                                  .getProductReviews(
                                                      productUrl: productUrl);
                                              await productImportantReviewsCubit
                                                  .getProductImportantReviews(
                                                      productUrl: productUrl);
                                            }
                                          }
                                        }
                                      },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    height: 25,
                                    value: 1,
                                    child: Row(
                                      children: [
                                        state is DeleteProductReviewLoading
                                            ? const CustomLoadingWidget(
                                                size: 25,
                                              )
                                            : const Icon(Icons.delete,
                                                color: Colors.red),
                                        const SizedBox(width: 8),
                                        Text(
                                          "Delete",
                                          style: Styles.style14Regular,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : const SizedBox()
                  ],
                ),
                ProductDetailsReviewRating(
                  count: reviewModel.rating ?? 0,
                ),
                10.verticalSizedBox,
                ReadMoreText(
                  reviewModel.comment ?? '',
                  trimMode: TrimMode.Line,
                  trimLines: 5,
                  style: Styles.style12Regular.copyWith(color: kSubTitleColor),
                  colorClickableText: Colors.pink,
                  moreStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
