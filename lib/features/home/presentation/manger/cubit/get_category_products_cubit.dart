import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/home/data/models/product_model.dart';
import 'package:elegant_shop_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_category_products_state.dart';

class GetCategoryProductsCubit extends Cubit<GetCategoryProductsState> {
  GetCategoryProductsCubit({required this.homeRepo})
      : super(GetCategoryProductsInitial());
  final HomeRepo homeRepo;
  List<ProductModel> products = [];
  Future<void> getProductsByCategory({required String apiUrl}) async {
    try {
      try {
        emit(GetCategoryProductsLoading());
        var data = await homeRepo.getProductsByCategory(apiUrl: apiUrl);
        data.fold((left) {
          emit(GetCategoryProductsFailure(errMessage: left.errorMessage));
        }, (right) {
          products = right;
          emit(GetCategoryProductsSuccess(products: products));
        });
      } catch (e) {
        emit(GetCategoryProductsFailure(errMessage: e.toString()));
      }
    } on StateError catch (e) {
      log('e: $e');
    }
  }

  @override
  void onChange(Change<GetCategoryProductsState> change) {
    log('change: ${change.toString()}');
    super.onChange(change);
  }
}
