import 'package:dio/dio.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:elegant_shop_app/features/cart/data/repos/cart_repo_implementation.dart';
import 'package:elegant_shop_app/features/favorite/data/repos/favorite_repo_implementation.dart';
import 'package:elegant_shop_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:elegant_shop_app/features/product_details/data/repos/product_details_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiService>(ApiService(dio: getIt.get<Dio>()));
  getIt.registerSingleton<AuthRepoImplementation>(
      AuthRepoImplementation(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ProductDetailsRepoImplementation>(
      ProductDetailsRepoImplementation(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<FavoriteRepoImplementation>(
      FavoriteRepoImplementation(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<CartRepoImplementation>(
      CartRepoImplementation(apiService: getIt.get<ApiService>()));
}
