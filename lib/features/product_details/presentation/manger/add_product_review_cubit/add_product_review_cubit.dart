// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/core/utils/custom_snack_bar.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_input_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:flutter/material.dart';

part 'add_product_review_state.dart';

class AddProductReviewCubit extends Cubit<AddProductReviewState> {
  AddProductReviewCubit({required this.productDetailsRepo})
      : super(AddProductReviewInitial());
  final ProductDetailsRepo productDetailsRepo;
  Future<bool> addProdutReview(
      {required ReviewInputModel reviewModel,
      required BuildContext context}) async {
    try {
      try {
        emit(AddProductReviewLoading());
        bool status = false;
        var data =
            await productDetailsRepo.addProductReview(reviewModel: reviewModel);
        data.fold((failure) {
          emit(AddProductReviewFailure(errMessage: failure.errorMessage));
          status = false;
          ElegantNotificationService.showErrorSnackBar('Error Happened', failure.errorMessage)
              ;
        }, (data) {
          emit(AddProductReviewSuccess());
          status = data;
        });
        return status;
      } catch (e) {
        emit(AddProductReviewFailure(errMessage: e.toString()));
        ElegantNotificationService.showErrorSnackBar('Error Happened', e.toString());

        return false;
      }
    } on StateError catch (e) {
      log('e: $e');
      return false;
    }
  }
}
