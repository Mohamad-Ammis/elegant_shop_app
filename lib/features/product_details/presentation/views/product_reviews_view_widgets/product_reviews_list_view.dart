import 'dart:developer';

import 'package:elegant_shop_app/core/widgets/custom_empty_state_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReviewsListView extends StatefulWidget {
  const ProductReviewsListView({
    super.key,
    required this.productUrl,
    required this.productImportantReviewsCubit,
    required this.reviewsCubit,
  });
  final String productUrl;
  final ProductImportantReviewsCubit productImportantReviewsCubit;
  final ProductReviewsCubit reviewsCubit;
  @override
  State<ProductReviewsListView> createState() => _ProductReviewsListViewState();
}

class _ProductReviewsListViewState extends State<ProductReviewsListView> {
  final ScrollController _scrollController = ScrollController();
  late ProductReviewsCubit cubit;
  @override
  void initState() {
    cubit = context.read<ProductReviewsCubit>();
    _scrollController.addListener(_onScroll); // الاستماع لعملية التمرير
    super.initState();
  }

  _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (cubit.state is! ProductReviewsLoading &&
          cubit.state is! ProductReviewsPaginaationLoading) {
        if (context.read<ProductReviewsCubit>().hasNext) {
          context.read<ProductReviewsCubit>().getProductReviews(
                productUrl: widget.productUrl,
                fromPagination: true,
              );
        } else {
          log('there is No more reviews');
        }
      } else {
        log('State is Loading so api will not call');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReviewsCubit, ProductReviewsState>(
      builder: (context, state) {
        return state is ProductReviewsSuccess ||
                state is ProductReviewsPaginaationLoading
            ? cubit.productReview.isEmpty
                ? const CustomEmptyStateWidget(
                    title: 'Sorry there is no reviews for this product')
                : ListView.separated(
                    controller: _scrollController,
                    itemCount: state is ProductReviewsPaginaationLoading
                        ? cubit.productReview.length + 1
                        : cubit.productReview.length,
                    itemBuilder: (context, index) {
                      return index < cubit.productReview.length
                          ? ProductDetailsReviewCard(
                              reviewModel: cubit.productReview[index],
                              productImportantReviewsCubit:
                                  widget.productImportantReviewsCubit,
                              reviewsCubit: widget.reviewsCubit,
                              productUrl: widget.productUrl,
                            )
                          : const CustomLoadingWidget();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 0.2,
                        indent: 20,
                        endIndent: 20,
                      );
                    },
                  )
            : state is ProductReviewsFailure
                ? CustomErrorWidget(title: state.errMessage)
                : const CustomLoadingWidget();
      },
    );
  }
}
