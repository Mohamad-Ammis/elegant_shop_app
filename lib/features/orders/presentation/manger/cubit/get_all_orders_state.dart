part of 'get_all_orders_cubit.dart';

@immutable
sealed class GetAllOrdersState {}

final class GetAllOrdersInitial extends GetAllOrdersState {}

final class GetAllOrdersLoading extends GetAllOrdersState {}
final class GetAllOrdersPaginationLoading extends GetAllOrdersState {}

final class GetAllOrdersFailure extends GetAllOrdersState {
  final String errMessage;

  GetAllOrdersFailure({required this.errMessage});
}
final class GetAllOrdersPaginationFailure extends GetAllOrdersState {
  final String errMessage;

  GetAllOrdersPaginationFailure({required this.errMessage});
}

final class GetAllOrdersSuccess extends GetAllOrdersState {
  final List<OrderModel> orders;

  GetAllOrdersSuccess({required this.orders});
}
