import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/home/data/models/product_model.dart';
import 'package:elegant_shop_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.homeRepo}) : super(ProductInitial());
  final HomeRepo homeRepo;
  int page = 1;
  int searchPage = 1;
  int selectedCategoryId = -1;
  bool hasNext = false;
  List<ProductModel> products = [];
  String searchText = '';
  Future<void> getAllProducts({bool fromPagination = false}) async {
    try {
      log('page $page');
      if (fromPagination) {
        emit(ProductPaginationLoading());
      } else {
        emit(ProductLoading());
      }
      var data = await homeRepo.getAllProducts(
        page: page,
      );
      data.fold((left) {
        if (fromPagination) {
          emit(ProductPaginationFailure(errMessage: left.errorMessage));
        } else {
          emit(ProductFailure(errMessage: left.errorMessage));
        }
      }, (right) {
        hasNext = right['has_next'];
        products = right['products'];
        emit(ProductSuccess());
        //حطيتا هون لانو اذا كانت برا فالعدد رح يزيد حتى لو فشل الريكويست وهاد خطأ لذلك بس يكون صار بحالة النجاح بتزيدا
        if (hasNext) {
          page++;
        }
      });
    } catch (e) {
      if (fromPagination) {
        emit(ProductPaginationFailure(errMessage: e.toString()));
      } else {
        emit(ProductFailure(errMessage: e.toString()));
      }
    }
  }

  Future<void> searchProducts({
    bool fromPagination = false,
  }) async {
    try {
      if (fromPagination) {
        emit(ProductPaginationLoading());
      } else {
        emit(ProductLoading());
      }
      var data =
          await homeRepo.searchProducts(page: page, searchText: searchText);
      data.fold((left) {
        if (fromPagination) {
          emit(ProductPaginationFailure(errMessage: left.errorMessage));
        } else {
          emit(ProductFailure(errMessage: left.errorMessage));
        }
      }, (right) {
        hasNext = right['has_next'];
        products = right['products'];
        emit(ProductSuccess());
        //حطيتا هون لانو اذا كانت برا فالعدد رح يزيد حتى لو فشل الريكويست وهاد خطأ لذلك بس يكون صار بحالة النجاح بتزيدا
        if (hasNext) {
          page++;
        }
      });
    } catch (e) {
      if (fromPagination) {
        emit(ProductPaginationFailure(errMessage: e.toString()));
      } else {
        emit(ProductFailure(errMessage: e.toString()));
      }
    }
  }

  Future<void> getProductsByCategory(
      {required String selectedCategorySlug}) async {
    try {
      emit(ProductLoading());
      var data = await homeRepo.getProductsByCategory(
          selectedCategorySlug: selectedCategorySlug);
      data.fold((left) {
        emit(ProductFailure(errMessage: left.errorMessage));
      }, (right) {
        products = right;
        emit(ProductSuccess());
      });
    } catch (e) {
      emit(ProductFailure(errMessage: e.toString()));
    }
  }
}
