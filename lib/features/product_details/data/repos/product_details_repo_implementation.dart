import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_input_model.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_model/review_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo.dart';
import 'package:elegant_shop_app/main.dart';

class ProductDetailsRepoImplementation implements ProductDetailsRepo {
  final ApiService apiService;

  ProductDetailsRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, ProductDetailsModel>> getProductsInfo(
      {required String productUrl}) async {
    try {
      var response = await apiService.get(url: productUrl, headers: {
        'Accept': 'application/json',
      });
      ProductDetailsModel model = ProductDetailsModel.fromJson(response.data);
      log('get product info Successfuly');
      return Right(model);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> getProductsImportantReviews(
      {required String productUrl}) async {
    try {
      log('${productUrl}reviews/?page=1&page_size=5');
      var response = await apiService
          .get(url: '${productUrl}reviews/?page=1&page_size=5', headers: {
        'Accept': 'application/json',
      });
      List<ReviewModel> reviews = [];
      for (var i = 0; i < response.data['results'].length; i++) {
        reviews.add(ReviewModel.fromJson(response.data['results'][i]));
      }
      log('get product important Reviews  Successfuly');
      log(reviews.toString());
      return Right(reviews);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  List<ReviewModel> productReviews = [];
  @override
  Future<Either<Failure, Map<String, dynamic>>> getProductsReviews(
      {required String productUrl, int page = 1}) async {
    try {
      bool hasNext = false;
      if (page == 1) {
        productReviews.clear();
      }
      var response = await apiService.get(
          url: '${productUrl}reviews/?page=$page&page_size=10',
          headers: {
            'Accept': 'application/json',
          },
          token: userInfo.getString('auth_token'));
      for (var i = 0; i < response.data['results'].length; i++) {
        productReviews.add(ReviewModel.fromJson(response.data['results'][i]));
      }
      if (response.data['next'] != null && response.data['next'] != '') {
        hasNext = true;
      } else {
        hasNext = false;
      }
      return Right({'has_next': hasNext, 'reviews': productReviews});
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addProductReview(
      {required ReviewInputModel reviewModel}) async {
    try {
      log(reviewModel.toJson().toString());
      var response = await apiService.post(
        url: '${reviewModel.apiUrl}reviews/',
        body: reviewModel.toJson(),
        headers: {
          "Accept": 'application/json',
          'Authorization': "Token ${userInfo.getString('auth_token')}"
        },
        contentType: 'application/json',
      );
      if (response.statusCode == 201) {
        log("Review Added Successfully");
        return const Right(true);
      }else {
        return const Right(false);
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
