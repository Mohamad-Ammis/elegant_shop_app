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
      //only for handel bad state exception
      try {
        emit(GetProductDetailsLoading());
        var data =
            await productDetailsRepo.getProductsInfo(productUrl: productUrl);
        data.fold((failure) {
          emit(GetProductDetailsFailure(errMessage: failure.errorMessage));
        }, (data) {
          emit(GetProductDetailsSuccess(productDetailsModel: data));
        });
      } catch (e) {
        emit(GetProductDetailsFailure(errMessage: e.toString()));
      }
    } on StateError catch (e) {
      log('e: $e');
    }
  }

  @override
  Future<void> close() {
    log('get product details cubit closed');
    return super.close();
  }
}
