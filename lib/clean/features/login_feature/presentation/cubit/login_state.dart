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
  final LoginModel model;
  const LoginLoaded({required this.model});
  @override
  List<Object> get props => [model];
}

class LoginError extends LoginState {
  const LoginError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class IsVisiblePasswordLoading extends LoginState {
  @override
  List<Object> get props => [];
}



class IsVisiblePasswordLoaded extends LoginState {
  @override
  List<Object> get props => [];
}
