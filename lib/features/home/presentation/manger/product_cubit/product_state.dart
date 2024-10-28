part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductSuccess extends ProductState {
  // final List<ProductModel> products;
  // final bool hasNext;
  // ProductSuccess({required this.hasNext, required this.products});
}

final class ProductLoading extends ProductState {}

final class ProductPaginationLoading extends ProductState {}

final class ProductFailure extends ProductState {
  final String errMessage;

  ProductFailure({required this.errMessage});
}

final class ProductPaginationFailure extends ProductState {
  final String errMessage;

  ProductPaginationFailure({required this.errMessage});
}
