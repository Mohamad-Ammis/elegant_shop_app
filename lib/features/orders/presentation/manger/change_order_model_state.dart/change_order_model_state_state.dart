part of 'change_order_model_state_cubit.dart';

@immutable
sealed class ChangeOrderModelStateState {}

final class ChangeOrderModelStateInitial extends ChangeOrderModelStateState {}
final class ChangeOrderModelStateSuccess extends ChangeOrderModelStateState {}
