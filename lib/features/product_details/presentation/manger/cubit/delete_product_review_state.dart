part of 'delete_product_review_cubit.dart';

@immutable
sealed class DeleteProductReviewState {}

final class DeleteProductReviewInitial extends DeleteProductReviewState {}

final class DeleteProductReviewLoading extends DeleteProductReviewState {}

final class DeleteProductReviewFailure extends DeleteProductReviewState {
  final String errMessage;

  DeleteProductReviewFailure({required this.errMessage});
}

final class DeleteProductReviewSuccess extends DeleteProductReviewState {}
