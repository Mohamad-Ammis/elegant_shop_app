// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_input_model.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/add_product_review_cubit/add_product_review_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:elegant_shop_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class AddReviewBottomSheet extends StatefulWidget {

  const AddReviewBottomSheet({
    super.key,
    required this.reviewsCubit,
    required this.productDetailsModel,
    required this.productImportantReviewsCubit,
  });
  final ProductDetailsModel productDetailsModel;
  final ProductImportantReviewsCubit productImportantReviewsCubit;
  final ProductReviewsCubit reviewsCubit;

  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  String comment = '';
  String rate = '1';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kMainPagePadding,
        right: kMainPagePadding,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: RatingBar.builder(
                initialRating: 1,
                itemSize: 35,
                itemBuilder: (context, index) {
                  return SvgPicture.asset(Assets.imagesStar);
                },
                onRatingUpdate: (val) {
                  rate = val.toString();
                  log('val: $val');
                },
                unratedColor: kSubTitleColor.withOpacity(.2),
                minRating: 1,
              ),
            ),
            16.verticalSizedBox,
            Column(
              children: [
                CustomTextField(
                  onChanged: (p0) {
                    comment = p0;
                  },
                  borderRadius: 12,
                  textStyle: Styles.style14Regular,
                  cursorColor: Colors.black,
                  label: 'Comment',
                  labelStyle: Styles.style16Regular.copyWith(color: Colors.black54),
                  filled: true,
                  fillColor: kLightGreyColor,
                  focusedBorderColor: kLightBlackColor.withOpacity(.2),
                  enabledBorderColor: Colors.transparent,
                  suffixIcon: null,
                  maxLines: 4,
                ),
                8.verticalSizedBox,
              ],
            ),
            BlocBuilder<AddProductReviewCubit, AddProductReviewState>(
              builder: (context, state) {
                return CustomButton(
                  onTap: state is AddProductReviewLoading
                      ? null
                      : () async {
                          await handleAddReviewLogic(context);
                        },
                  color: kPrimaryColor,
                  child: Center(
                    child: state is AddProductReviewLoading
                        ? const CustomLoadingWidget()
                        : Text(
                            'Submit',
                            style: Styles.style16Bold
                                .copyWith(color: Colors.white),
                          ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Future<void> handleAddReviewLogic(BuildContext context) async {
    final AddProductReviewCubit cubit = context.read<AddProductReviewCubit>();
    ReviewInputModel model = ReviewInputModel(
        apiUrl: widget.productDetailsModel.absoluteUrl!,
        comment: comment,
        rating: rate,
        product: widget.productDetailsModel.id.toString(),
        user: userInfo.getString('user_name').toString());
    var status = await cubit.addProdutReview(reviewModel: model);
    log('status: $status');
    if (status) {
      Navigator.of(context).pop();
      widget.reviewsCubit.page = 1;
      widget.reviewsCubit.getProductReviews(
          productUrl: widget.productDetailsModel.absoluteUrl!);
      widget.productImportantReviewsCubit.getProductImportantReviews(
          productUrl: widget.productDetailsModel.absoluteUrl!);
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('something went wrong')));
    }
  }
}
