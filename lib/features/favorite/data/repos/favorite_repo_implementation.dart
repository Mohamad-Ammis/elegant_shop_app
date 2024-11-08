import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/core/utils/api_service.dart';
import 'package:elegant_shop_app/features/favorite/data/repos/favorite_repo.dart';
import 'package:elegant_shop_app/main.dart';

class FavoriteRepoImplementation implements FavoriteRepo {
  final ApiService apiService;

  FavoriteRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, bool>> toggleFavorite(
      {required String productID}) async {
    try {
      var response = await apiService.post(
          url: '$kBaseUrl/products/$productID/toggle_favorite/',
          body: {},
          headers: {
            "Accept": 'application/json',
            "Authorization": "Token ${userInfo.getString('auth_token')}"
          },
          contentType: 'application/json');
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return const Right(true);
      } else if (response.statusCode == 204) {
        return const Right(false);
      } else {
        return left(ServerFailure(errorMessage: 'unexpected action'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
