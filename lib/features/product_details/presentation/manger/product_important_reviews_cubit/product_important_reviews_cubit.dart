import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_model/review_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:meta/meta.dart';

part 'product_important_reviews_state.dart';

class ProductImportantReviewsCubit extends Cubit<ProductImportantReviewsState> {
  ProductImportantReviewsCubit({required this.productDetailsRepo})
      : super(ProductImportantReviewsInitial());
  final ProductDetailsRepo productDetailsRepo;
  Future<void> getProductImportantReviews({required String productUrl}) async {
    try {
  try {
    emit(ProductImportantReviewsLoading());
  
    var data = await productDetailsRepo.getProductsImportantReviews(
        productUrl: productUrl);
    data.fold((failure) {
      emit(ProductImportantReviewsFailure(errMessage: failure.errorMessage));
    }, (data) {
      emit(ProductImportantReviewsSuccess(reviews: data));
    });
  } catch (e) {
    emit(ProductImportantReviewsFailure(errMessage: e.toString()));
  }
} on StateError catch (e) {
  log('e: ${e}');
  // TODO
}
  }

  @override
  Future<void> close() {
    log('reviews cubit closed');
    return super.close();
  }
}
