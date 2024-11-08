import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';

abstract class FavoriteRepo {
    Future<Either<Failure, bool>> toggleFavorite(
      {required String productID});
}