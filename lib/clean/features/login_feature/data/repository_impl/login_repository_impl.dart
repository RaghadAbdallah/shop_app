import 'package:dartz/dartz.dart';
import 'package:shop_app/clean/core/domain/error/failure.dart';
import 'package:shop_app/clean/features/login_feature/data/datasource/login_remote_data.dart';
import 'package:shop_app/clean/features/login_feature/domain/repository/login_repository.dart';

import '../../../../core/domain/error/exceptions/exceptions.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({required this.loginDataSource});

  final LoginDataSource loginDataSource;

  @override
  Future<Either<Failure, void>> getLoginData(
      {required String email, required String password}) async {
    try {
      return Right(
          loginDataSource.getLoginInfo(email: email, password: password));
    } on ServerException {
      return const Left(ServerFailure(message: ''));
    }
  }
}
