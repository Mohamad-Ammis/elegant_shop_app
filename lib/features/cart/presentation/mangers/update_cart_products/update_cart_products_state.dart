part of 'update_cart_products_cubit.dart';

@immutable
sealed class UpdateCartProductsState {}

final class UpdateCartProductsInitial extends UpdateCartProductsState {}

final class UpdateCartProductsLoading extends UpdateCartProductsState {}

final class UpdateCartProductsSuccess extends UpdateCartProductsState {}

final class UpdateCartProductsFailure extends UpdateCartProductsState {
  final String errMessage;

  UpdateCartProductsFailure({required this.errMessage});
}
