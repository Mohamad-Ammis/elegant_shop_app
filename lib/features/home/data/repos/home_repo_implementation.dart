import 'dart:async';
import 'dart:developer';
import 'dart:io';

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
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  List<ProductModel> products = [];
  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllProducts({
    int page = 1,
  }) async {
    try {
      log(page.toString());
      if (page == 1) {
        products.clear();
      }
      log('$kBaseUrl/products/?page=$page&page_size=$kPaginiationPageSize');
      var response = await apiService.get(
        url: '$kBaseUrl/products/?page=$page&page_size=$kPaginiationPageSize',
      );
      if (response.statusCode == 200) {
        for (var product in response.data['results']) {
          products.add(ProductModel.fromJson(product));
        }
        log('************get All Products Successfully ******************* ');
        return Right({
          'products': products,
          'has_next': response.data['next'] != null,
        });
      } else {
        return Left(ServerFailure(errorMessage: 'Response or data is null'));
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  Timer? _searchDebounce;
  @override
  Future<Either<Failure, Map<String, dynamic>>> searchProducts(
      {int page = 1, String? searchText}) async {
    try {
      if (page == 1) {
        products = [];
      }
      log('$kBaseUrl/products/?page=$page&page_size=$kPaginiationPageSize&search=$searchText');
      var response = await apiService.get(
        url:
            '$kBaseUrl/products/?page=$page&page_size=$kPaginiationPageSize&search=$searchText',
      );
      if (response.statusCode == 200) {
        for (var product in response.data['results']) {
          products.add(ProductModel.fromJson(product));
        }
        log('************get Searched Products Successfully ******************* ');
        return Right({
          'products': products,
          'has_next': response.data['next'] != null,
        });
      } else {
        return Left(ServerFailure(errorMessage: 'Response or data is null'));
      }
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioException(dioError));
    } on SocketException {
      return Left(ServerFailure(errorMessage: 'No internet connection'));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  List<ProductModel> categoryProducts = [];
  @override
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(
      {required String apiUrl}) async {
    try {
      categoryProducts = [];
      log(apiUrl);
      var response = await apiService.get(
        url: apiUrl,
      );
      if (response.data != null) {
        for (var product in response.data['products']) {
          categoryProducts.add(ProductModel.fromJson(product));
        }
        log('************get Products By Category Successfully ******************* ');
        log(categoryProducts.toList().toString());
        return Right(categoryProducts);
      } else {
        return Left(ServerFailure(errorMessage: 'Response or data is null'));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
