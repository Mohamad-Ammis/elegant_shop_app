part of 'product_reviews_cubit.dart';

@immutable
sealed class ProductReviewsState {}

final class ProductReviewsInitial extends ProductReviewsState {}

final class ProductReviewsLoading extends ProductReviewsState {}

final class ProductReviewsFailure extends ProductReviewsState {
  final String errMessage;

  ProductReviewsFailure({required this.errMessage});
}

final class ProductReviewsSuccess extends ProductReviewsState {
  final List<ReviewModel> reviews;

  ProductReviewsSuccess({required this.reviews});
}
