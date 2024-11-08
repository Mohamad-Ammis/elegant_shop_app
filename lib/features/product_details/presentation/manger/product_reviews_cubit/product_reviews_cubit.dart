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
  int page = 1;
  List<ReviewModel> productReview = [];
  bool hasNext = false;
  Future<void> getProductReviews(
      {required String productUrl, bool fromPagination = false}) async {
    try {
      //only for handel bad state exception
      try {
        if (fromPagination) {
          emit(ProductReviewsPaginaationLoading());
        } else {
          emit(ProductReviewsLoading());
        }
        var data = await productDetailsRepo.getProductsReviews(
            productUrl: productUrl, page: page);
        data.fold((failure) {
          emit(ProductReviewsFailure(errMessage: failure.errorMessage));
        }, (success) {
          hasNext = success['has_next'];
          productReview = success['reviews'];
          log(productReview.length.toString());
          if (hasNext) {
            page++;
          }
          emit(ProductReviewsSuccess(reviews: productReview));
        });
      } catch (e) {
        emit(ProductReviewsFailure(errMessage: e.toString()));
      }
    } on StateError catch (e) {
      log('e: $e');
    }
  }
}
