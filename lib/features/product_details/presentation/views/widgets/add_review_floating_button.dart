import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo_implementation.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/add_product_review_cubit/add_product_review_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_important_reviews_cubit/product_important_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/manger/product_reviews_cubit/product_reviews_cubit.dart';
import 'package:elegant_shop_app/features/product_details/presentation/views/widgets/add_review_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReviewFloatingButton extends StatelessWidget {
  const AddReviewFloatingButton({
    super.key,
    required this.productDetailsModel,
    required this.productImportantReviewsCubit,
  });
  final ProductDetailsModel productDetailsModel;
  final ProductImportantReviewsCubit productImportantReviewsCubit;

  @override
  Widget build(BuildContext context) {
    final reviewsCubit = context.read<ProductReviewsCubit>();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: kBackgroundColor,
          context: context,
          isDismissible: true,
          showDragHandle: true,
          // isScrollControlled: true,
          builder: (context) {
            return BlocProvider(
              create: (context) => AddProductReviewCubit(
                  productDetailsRepo:
                      getIt.get<ProductDetailsRepoImplementation>()),
              child: AddReviewBottomSheet(
                reviewsCubit: reviewsCubit,
                productDetailsModel: productDetailsModel,
                productImportantReviewsCubit: productImportantReviewsCubit,
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
