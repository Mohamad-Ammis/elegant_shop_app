import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:meta/meta.dart';

part 'delete_product_review_state.dart';

class DeleteProductReviewCubit extends Cubit<DeleteProductReviewState> {
  DeleteProductReviewCubit({required this.productDetailsRepo})
      : super(DeleteProductReviewInitial());
  final ProductDetailsRepo productDetailsRepo;
  Future<bool> deleteProductReview(
      {required String productUrl, required String reviewId}) async {
    try {
      try {
        emit(DeleteProductReviewLoading());
        bool status = false;
        var data = await productDetailsRepo.deleteProductReview(
            productUrl: productUrl, reviewId: reviewId);
        data.fold((failure) {
          emit(DeleteProductReviewFailure(errMessage: failure.errorMessage));
          status = false;
        }, (data) {
          emit(DeleteProductReviewSuccess());
          status = data;
        });
        return status;
      } catch (e) {
        emit(DeleteProductReviewFailure(errMessage: e.toString()));
        return false;
      }
    } on StateError catch (e) {
      log('e: $e');
      return false;
    }
  }
}
