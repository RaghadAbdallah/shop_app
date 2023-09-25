import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/clean/core/domain/error/failure.dart';
import 'package:shop_app/clean/core/domain/use_case/usecase.dart';
import 'package:shop_app/clean/features/login_feature/domain/repository/login_repository.dart';
import '../../data/model/login_model.dart';

class LoginUseCase implements UseCase<LoginModel, LoginParams> {
  const LoginUseCase({required this.repository});

  final LoginRepository repository;

  @override
  Future<Either<Failure, LoginModel>> call(LoginParams params) async {
    return repository.getLoginData(
        email: params.email, password: params.password);
  }
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
