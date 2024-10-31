import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/product_details_review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsReviewsList extends StatelessWidget {
  const ProductDetailsReviewsList({super.key, required this.productUrl});
  final String productUrl;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductImportantReviewsCubit,
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
                          'Reviews (7201)',
                          style: Styles.style20Regular,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.all(0),
                            ),
                          ),
                          onPressed: () {
                            context.push(AppRouter.kProductDetailsReviewsView,extra:productUrl );
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        return ProductDetailsReviewCard(
                            reviewModel: state.reviews[index]);
                      },
                    ),
                  ],
                ),
              )
            : state is ProductImportantReviewsFailure
                ? CustomErrorWidget(title: state.errMessage)
                : CustomLoadingWidget();
      },
    );
  }
}
