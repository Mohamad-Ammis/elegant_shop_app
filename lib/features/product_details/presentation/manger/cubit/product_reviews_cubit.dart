import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_model/review_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:meta/meta.dart';

part 'product_reviews_state.dart';

class ProductReviewsCubit extends Cubit<ProductReviewsState> {
  ProductReviewsCubit({required this.productDetailsRepo})
      : super(ProductReviewsInitial());
  final ProductDetailsRepo productDetailsRepo;
  Future<void> getProductImportantReviews({required String productUrl}) async {
    try {
      try {
        emit(ProductReviewsLoading());
      } on Exception catch (e) {
        log('e: ${e}');
      }
      var data = await productDetailsRepo.getProductsImportantReviews(
          productUrl: productUrl);
      data.fold((failure) {
        try {
          emit(ProductReviewsFailure(errMessage: failure.errorMessage));
        } on Exception catch (e) {
          log('e: ${e}');
        }
      }, (data) {
        try {
          emit(ProductReviewsSuccess(reviews: data));
        } on Exception catch (e) {
          log('e: ${e}');
        }
      });
    } catch (e) {
      try {
        emit(ProductReviewsFailure(errMessage: e.toString()));
      } on Exception catch (e) {
        log('e: ${e}');
      }
    }
  }
}
