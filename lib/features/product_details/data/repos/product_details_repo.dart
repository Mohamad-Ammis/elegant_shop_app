import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/features/product_details/data/models/product_details_model/product_details_model.dart';
import 'package:elegant_shop_app/features/product_details/data/models/review_model/review_model.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsModel>> getProductsInfo(
      {required String productUrl});
      
  Future<Either<Failure, List<ReviewModel>>> getProductsImportantReviews(
      {required String productUrl});

}
