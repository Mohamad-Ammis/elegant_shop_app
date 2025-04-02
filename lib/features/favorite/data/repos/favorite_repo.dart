import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, bool>> toggleFavorite({required String productID});
  Future<Either<Failure, Map<String, dynamic>>> getAllProducts({int page = 1});



  
}
