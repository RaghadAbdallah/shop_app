import 'package:dartz/dartz.dart';
import 'package:shop_app/clean/core/domain/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, void>> getLoginData({required String email,required String password});
}
