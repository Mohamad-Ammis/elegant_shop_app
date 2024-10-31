part of 'get_product_details_cubit.dart';

@immutable
sealed class GetProductDetailsState {}

final class GetProductDetailsInitial extends GetProductDetailsState {}

final class GetProductDetailsLoading extends GetProductDetailsState {}

final class GetProductDetailsFailure extends GetProductDetailsState {
  final String errMessage;

  GetProductDetailsFailure({required this.errMessage});
}

final class GetProductDetailsSuccess extends GetProductDetailsState {
  final ProductDetailsModel productDetailsModel;

  GetProductDetailsSuccess({required this.productDetailsModel});
}
