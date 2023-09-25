part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoaded extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  const LoginError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class PasswordVisibility extends LoginState {
  @override
  List<Object> get props => [];
}
