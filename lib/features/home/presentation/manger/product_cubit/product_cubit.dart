import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
  bool searchHasNext = false;
  List<ProductModel> products = [];
  String searchText = '';
  Future<void> getAllProducts({bool fromPagination = false}) async {
    try {
      try {
        if (page == 1) {
          products.clear();
        }
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
    } on StateError catch (e) {
      log('e: $e');
    }
  }

  Future<void> searchProducts({
    bool? fromPagination,
  }) async {
    try {
      try {
        if (searchPage == 1) {
          products.clear();
        }
        if (fromPagination ?? false) {
          log('*//*******************/*/*/*/*/*/*/*/*/*/*/*(*//*******************/*/*/*/*/*/*/*/*/*/*/*');
          emit(ProductPaginationLoading());
        } else {
          products = [];
          emit(ProductLoading());
        }
        var data = await homeRepo.searchProducts(
          page: searchPage,
          searchText: searchText,
        );
        data.fold((left) {
          if (fromPagination ?? false) {
            emit(ProductPaginationFailure(errMessage: left.errorMessage));
          } else {
            emit(ProductFailure(errMessage: left.errorMessage));
          }
        }, (right) {
          searchHasNext = right['has_next'];
          products = right['products'];
          emit(ProductSuccess());
          //حطيتا هون لانو اذا كانت برا فالعدد رح يزيد حتى لو فشل الريكويست وهاد خطأ لذلك بس يكون صار بحالة النجاح بتزيدا
          if (searchHasNext) {
            searchPage++;
          }
        });
      } on DioException catch (e) {
        if (fromPagination ?? false) {
          emit(ProductPaginationFailure(errMessage: e.toString()));
        } else {
          emit(ProductFailure(errMessage: e.toString()));
        }
      } on SocketException catch (e) {
        if (fromPagination ?? false) {
          emit(ProductPaginationFailure(errMessage: e.toString()));
        } else {
          emit(ProductFailure(errMessage: e.toString()));
        }
      } catch (e) {
        if (fromPagination ?? false) {
          emit(ProductPaginationFailure(errMessage: e.toString()));
        } else {
          emit(ProductFailure(errMessage: e.toString()));
        }
      }
    } on StateError catch (e) {
      log('e: $e');
    }
  }

  @override
  Future<void> close() {
    log('home Cubit closed');
    return super.close();
  }
}
