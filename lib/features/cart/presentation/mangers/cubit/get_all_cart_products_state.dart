part of 'get_all_cart_products_cubit.dart';

@immutable
sealed class GetAllCartProductsState {}

final class GetAllCartProductsInitial extends GetAllCartProductsState {}

final class GetAllCartProductsLoading extends GetAllCartProductsState {}

final class GetAllCartProductsFailure extends GetAllCartProductsState {
  final String errMessage;

  GetAllCartProductsFailure({required this.errMessage});
}

final class GetAllCartProductsSuccess extends GetAllCartProductsState {
  final List<CartProductModel> cartProducts;

  GetAllCartProductsSuccess({required this.cartProducts});
}
