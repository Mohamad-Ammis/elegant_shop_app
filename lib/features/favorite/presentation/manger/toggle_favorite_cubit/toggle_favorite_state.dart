part of 'toggle_favorite_cubit.dart';

@immutable
sealed class ToggleFavoriteState {}

final class ToggleFavoriteInitial extends ToggleFavoriteState {}

final class ToggleFavoriteSuccess extends ToggleFavoriteState {}

final class ToggleFavoriteLoading extends ToggleFavoriteState {}

final class ToggleFavoriteFailure extends ToggleFavoriteState {
  final String errMessage;

  ToggleFavoriteFailure({required this.errMessage});
}
