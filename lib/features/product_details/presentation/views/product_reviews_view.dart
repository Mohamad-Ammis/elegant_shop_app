import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/custom_app_bar.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/product_reviews_view_widgets/product_reviews_view_body.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/add_review_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReviewsView extends StatefulWidget {
  const ProductReviewsView({super.key, required this.productDetailsModel});
  final ProductDetailsModel productDetailsModel;

  @override
  State<ProductReviewsView> createState() => _ProductReviewsViewState();
}

class _ProductReviewsViewState extends State<ProductReviewsView> {
  @override
  void initState() {
    super.initState();

    // استدعاء getProductReviews عند تحميل الصفحة
    context
        .read<ProductReviewsCubit>()
        .getProductReviews(productUrl: widget.productDetailsModel.absoluteUrl!);
  }

  // Future<void> _navigateAndAddReview() async {
  //   final reviewsCubit = context.read<ProductReviewsCubit>();

  //   // await Navigator.of(context).push(
  //   //   MaterialPageRoute(
  //   //     builder: (_) => AddReviewBottomSheet(
  //   //       reviewsCubit: reviewsCubit,
  //   //       productUrl: widget.productUrl,
  //   //     ),
  //   //   ),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: AddReviewFloatingButton(
        productDetailsModel: widget.productDetailsModel,
      ),
      appBar: CustomAppbar(title: 'Reviews'),
      backgroundColor: kBackgroundColor,
      body: ProductReviewsViewBody(
        productUrl: widget.productDetailsModel.absoluteUrl!,
      ),
    );
  }
}
