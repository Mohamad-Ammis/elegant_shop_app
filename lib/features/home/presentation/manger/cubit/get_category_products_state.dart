part of 'get_category_products_cubit.dart';

@immutable
sealed class GetCategoryProductsState {}

final class GetCategoryProductsInitial extends GetCategoryProductsState {}

final class GetCategoryProductsLoading extends GetCategoryProductsState {}

final class GetCategoryProductsFailure extends GetCategoryProductsState {
  final String errMessage;

  GetCategoryProductsFailure({required this.errMessage});
}

final class GetCategoryProductsSuccess extends GetCategoryProductsState {
  final List<ProductModel> products;

  GetCategoryProductsSuccess({required this.products});
}
