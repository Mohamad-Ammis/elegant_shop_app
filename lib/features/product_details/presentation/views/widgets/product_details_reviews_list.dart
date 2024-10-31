import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsReviewsList extends StatelessWidget {
  const ProductDetailsReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReviewsCubit, ProductReviewsState>(
      builder: (context, state) {
        return state is ProductReviewsSuccess
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kMainPagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.verticalSizedBox,
                    Text(
                      'Reviews (7201)',
                      style: Styles.style20Regular,
                    ),
                    16.verticalSizedBox,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        return  ProductDetailsReviewCard(reviewModel:state.reviews[index]);
                      },
                    ),
                  ],
                ),
              )
            : state is ProductReviewsFailure
                ? CustomErrorWidget(title: state.errMessage)
                : CustomLoadingWidget();
      },
    );
  }
}
