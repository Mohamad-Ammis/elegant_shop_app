part of 'delete_cart_product_cubit.dart';

@immutable
sealed class DeleteCartProductState {}

final class DeleteCartProductInitial extends DeleteCartProductState {}
final class DeleteCartProductLoading extends DeleteCartProductState {}
final class DeleteCartProductSuccess extends DeleteCartProductState {}
final class DeleteCartProductFailure extends DeleteCartProductState {}
