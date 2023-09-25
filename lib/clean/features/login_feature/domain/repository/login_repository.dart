import 'package:dartz/dartz.dart';
import 'package:shop_app/clean/core/domain/error/failure.dart';
import '../../data/model/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> getLoginData(
      {required String email, required String password});
}
