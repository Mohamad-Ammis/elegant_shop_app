part of 'product_important_reviews_cubit.dart';

@immutable
sealed class ProductImportantReviewsState {}

final class ProductImportantReviewsInitial extends ProductImportantReviewsState {}

final class ProductImportantReviewsLoading extends ProductImportantReviewsState {}

final class ProductImportantReviewsFailure extends ProductImportantReviewsState {
  final String errMessage;

  ProductImportantReviewsFailure({required this.errMessage});
}

final class ProductImportantReviewsSuccess extends ProductImportantReviewsState {
  final List<ReviewModel> reviews;

  ProductImportantReviewsSuccess({required this.reviews});
}
