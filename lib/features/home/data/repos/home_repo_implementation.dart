import 'dart:async';
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
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  List<ProductModel> products = [];
  Timer? _debounce;
  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllProducts({
    int page = 1,
  }) async {
    try {
      if (page == 1) {
        products = [];
      }
      // استخدمتو لخزن فيو البيانات يلي رح رجعا بعد التايمر
      Completer<Either<Failure, Map<String, dynamic>>> completer = Completer();
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        log('$kBaseUrl/products/?page=$page&page_size=$kPaginiationPageSize');
        var response = await apiService.get(
          url: '$kBaseUrl/products/?page=$page&page_size=$kPaginiationPageSize',
        );
        if (response.data != null) {
          for (var product in response.data['results']) {
            products.add(ProductModel.fromJson(product));
          }
          log('************get All Products Successfully ******************* ');
          completer.complete(Right({
            'products': products,
            'has_next': response.data['next'] != null,
          }));
        } else {
          completer.complete(
              Left(ServerFailure(errorMessage: 'Response or data is null')));
        }
      });
      return completer.future;
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
      // استخدمتو لخزن فيو البيانات يلي رح رجعا بعد التايمر
      Completer<Either<Failure, Map<String, dynamic>>> completer = Completer();
      if (_searchDebounce?.isActive ?? false) _searchDebounce!.cancel();
      _searchDebounce = Timer(const Duration(milliseconds: 500), () async {
        log('$kBaseUrl/products/?page=$page&page_size=$kPaginiationPageSize&search=$searchText');
        var response = await apiService.get(
          url:
              '$kBaseUrl/products/?page=$page&page_size=$kPaginiationPageSize&search=$searchText',
        );
        if (response.data != null) {
          for (var product in response.data['results']) {
            products.add(ProductModel.fromJson(product));
          }
          log('************get Searched Products Successfully ******************* ');
          completer.complete(Right({
            'products': products,
            'has_next': response.data['next'] != null,
          }));
        } else {
          completer.complete(
              Left(ServerFailure(errorMessage: 'Response or data is null')));
        }
      });
      return completer.future;
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory(
      {required String selectedCategorySlug}) async {
    try {
      products = [];
      log('$kBaseUrl/products/$selectedCategorySlug/');
      var response = await apiService.get(
        url: '$kBaseUrl/products/$selectedCategorySlug/',
      );
      if (response.data != null) {
        for (var product in response.data['products']) {
          products.add(ProductModel.fromJson(product));
        }
        log('************get Products By Category Successfully ******************* ');
        log(products.toList().toString());
        return Right(products);
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
