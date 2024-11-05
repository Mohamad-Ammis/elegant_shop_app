import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_input_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:meta/meta.dart';

part 'add_product_review_state.dart';

class AddProductReviewCubit extends Cubit<AddProductReviewState> {
  AddProductReviewCubit({required this.productDetailsRepo})
      : super(AddProductReviewInitial());
  final ProductDetailsRepo productDetailsRepo;
  Future<bool> addProdutReview({required ReviewInputModel reviewModel}) async {
    try {
      emit(AddProductReviewLoading());
      bool status = false;
      var data =
          await productDetailsRepo.addProductReview(reviewModel: reviewModel);
      data.fold((failure) {
        emit(AddProductReviewFailure(errMessage: failure.errorMessage));
        status = false;
      }, (data) {
        emit(AddProductReviewSuccess());
        status = data;
      });
      return status;
    } catch (e) {
      emit(AddProductReviewFailure(errMessage: e.toString()));
      return false;
    }
  }
}
