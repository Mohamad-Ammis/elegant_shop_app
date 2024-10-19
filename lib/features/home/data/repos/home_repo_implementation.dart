import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/features/home/data/models/category_model/category_model.dart';
import 'package:elegant_shop_app/features/home/data/models/product_model.dart';
import 'package:elegant_shop_app/features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  @override
  HomeRepoImplementation({required this.apiService});
  final ApiService apiService;
  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      List<CategoryModel> categories = [];
      var response = await apiService.get(
        url: '$kBaseUrl/categories/',
      );
      for (var category in response.data) {
        categories.add(CategoryModel.fromJson(category));
      }
      log('************get categories Successfully ******************* ');
      return Right(categories);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioException(e));
      }
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  List<ProductModel> products = [];
  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllProducts(
      {int page = 1, int? selectedCategortId}) async {
    try {
      log('category $selectedCategortId');
      var response = await apiService.get(
        url:
            '$kBaseUrl/products/?page=$page&page_size=5&category=$selectedCategortId',
      );
      for (var product in response.data['results']) {
        products.add(ProductModel.fromJson(product));
      }
      log('************get Products Successfully ******************* ');
      return Right(
          {'products': products, 'has_next': response.data['next'] != null});
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFaliure.fromDioException(e));
      }
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }
}
