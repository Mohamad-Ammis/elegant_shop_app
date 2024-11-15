import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';

abstract class OrderRepo {
  Future<Either<Failure, Map<String, dynamic>>> getAllOrders({
    int page = 1,
  });
}
