part of 'add_product_review_cubit.dart';

@immutable
sealed class AddProductReviewState {}

final class AddProductReviewInitial extends AddProductReviewState {}

final class AddProductReviewLoading extends AddProductReviewState {}

final class AddProductReviewFailure extends AddProductReviewState {
  final String errMessage;

  AddProductReviewFailure({required this.errMessage});
}

final class AddProductReviewSuccess extends AddProductReviewState {}
