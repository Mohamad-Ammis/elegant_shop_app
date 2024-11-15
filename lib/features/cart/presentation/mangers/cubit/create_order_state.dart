part of 'create_order_cubit.dart';

@immutable
sealed class CreateOrderState {}

final class CreateOrderInitial extends CreateOrderState {}

final class CreateOrderLoading extends CreateOrderState {}

final class CreateOrderSuccess extends CreateOrderState {
  final OrderModel orderModel;

  CreateOrderSuccess({required this.orderModel});
}

final class CreateOrderFailure extends CreateOrderState {}
