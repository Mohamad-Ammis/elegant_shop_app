import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:meta/meta.dart';

part 'get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetailsCubit({required this.productDetailsRepo})
      : super(GetProductDetailsInitial());
  final ProductDetailsRepo productDetailsRepo;
  Future<void> getProductDetails({required String productUrl}) async {
    try {
      try {
        emit(GetProductDetailsLoading());
      } on Exception catch (e) {
        log('e: ${e}');
      }
      var data =
          await productDetailsRepo.getProductsInfo(productUrl: productUrl);
      data.fold((failure) {
        try {
          emit(GetProductDetailsFailure(errMessage: failure.errorMessage));
        } on Exception catch (e) {
          log('e: ${e}');
        }
      }, (data) {
        try {
          emit(GetProductDetailsSuccess(productDetailsModel: data));
        } on Exception catch (e) {
          log('e: ${e}');
        }
      });
    } catch (e) {
      try {
        emit(GetProductDetailsFailure(errMessage: e.toString()));
      } on Exception catch (e) {
        log('e: ${e}');
      }
    }
  }
}
