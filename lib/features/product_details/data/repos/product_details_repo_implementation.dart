import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo.dart';

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
}
