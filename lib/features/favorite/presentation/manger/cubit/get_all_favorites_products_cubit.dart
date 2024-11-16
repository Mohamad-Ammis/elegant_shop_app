import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elegant_shop_app/features/favorite/data/models/favorite_product_model.dart';
import 'package:elegant_shop_app/features/favorite/data/repos/favorite_repo.dart';
import 'package:meta/meta.dart';

part 'get_all_favorites_products_state.dart';

class GetAllFavoritesProductsCubit extends Cubit<GetAllFavoritesProductsState> {
  GetAllFavoritesProductsCubit({required this.favoriteRepo})
      : super(GetAllFavoritesProductsInitial());
  final FavoriteRepo favoriteRepo;
  List<FavoriteProductModel> products = [];
  bool hasNext = false;
  int page = 1;
  Future<void> getAllFavoriteProducts(
      {int page = 1, bool formPagination = false}) async {
    try {
  try {
    if (formPagination) {
      emit(GetAllFavoritesProductsPaginationLoading());
    } else {
      emit(GetAllFavoritesProductsLoading());
    }
    var data = await favoriteRepo.getAllProducts(page: this.page);
    data.fold((failure) {
      if (formPagination) {
        emit(GetAllFavoritesProductsPaginationFailure(
            errMessage: failure.errorMessage));
      } else {
        emit(
            GetAllFavoritesProductsFailure(errMessage: failure.errorMessage));
      }
    }, (success) {
      products = success['products'];
      hasNext = success['hasNext'];
      log('success[hasNext]: ${success['hasNext']}');
      log('hasNext: $hasNext');
      emit(GetAllFavoritesProductsSuccess(products: success['products']));
      if (hasNext) {
        this.page++;
      }
    });
  } catch (e) {
    if (formPagination) {
      emit(
          GetAllFavoritesProductsPaginationFailure(errMessage: e.toString()));
    }
    emit(GetAllFavoritesProductsFailure(errMessage: e.toString()));
  }
} on StateError catch (e) {
  log('e: $e');
}
  }

  @override
  void onChange(Change<GetAllFavoritesProductsState> change) {
    log('change: $change');

    super.onChange(change);
  }
}
