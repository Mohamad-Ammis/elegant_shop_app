part of 'pay_exist_order_cubit.dart';

@immutable
sealed class PayExistOrderState {}

final class PayExistOrderInitial extends PayExistOrderState {}

final class PayExistOrderSuccess extends PayExistOrderState {}

final class PayExistOrderLoading extends PayExistOrderState {}

final class PayExistOrderFailure extends PayExistOrderState {}
