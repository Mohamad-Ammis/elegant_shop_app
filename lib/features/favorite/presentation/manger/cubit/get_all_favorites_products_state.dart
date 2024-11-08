part of 'get_all_favorites_products_cubit.dart';

@immutable
sealed class GetAllFavoritesProductsState {}

final class GetAllFavoritesProductsInitial
    extends GetAllFavoritesProductsState {}

final class GetAllFavoritesProductsLoading
    extends GetAllFavoritesProductsState {}

final class GetAllFavoritesProductsFailure
    extends GetAllFavoritesProductsState {
  final String errMessage;

  GetAllFavoritesProductsFailure({required this.errMessage});
}

final class GetAllFavoritesProductsSuccess
    extends GetAllFavoritesProductsState {
  final List<FavoriteProductModel> products;

  GetAllFavoritesProductsSuccess({required this.products});
}

final class GetAllFavoritesProductsPaginationFailure
    extends GetAllFavoritesProductsState {
  final String errMessage;

  GetAllFavoritesProductsPaginationFailure({required this.errMessage});
}

final class GetAllFavoritesProductsPaginationLoading
    extends GetAllFavoritesProductsState {}
