import 'package:elegant_shop_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:elegant_shop_app/features/auth/data/models/register_input_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> signIn(
      {required String userName, required String password});
  Future<Either<Failure, bool>> signUp(
      {required RegisterInputModel registerInputModel});
  Future<bool> logOut();
}
