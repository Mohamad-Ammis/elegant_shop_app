part of 'cancel_exist_order_cubit.dart';

@immutable
sealed class CancelExistOrderState {}

final class CancelExistOrderInitial extends CancelExistOrderState {}

final class CancelExistOrderLoading extends CancelExistOrderState {}

final class CancelExistOrderSuccess extends CancelExistOrderState {}

final class CancelExistOrderFailure extends CancelExistOrderState {}
