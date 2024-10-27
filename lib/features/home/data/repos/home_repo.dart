import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:elegant_shop_app/features/home/data/models/category_model/category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  Future<Either<Failure, Map<String, dynamic>>> getAllProducts({
    int page = 1,
    int? selectedCategortId,
  });
  Future<Either<Failure, Map<String, dynamic>>> searchProducts(
      {int page = 1, String? searchText});
}
