import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/clean/features/login_feature/domain/usecase/login_usecase.dart';

import '../../data/model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  LoginUseCase loginUseCase;

  static LoginCubit get(context) => BlocProvider.of(context);

  getLoginSuccess({required String email, required String password}) async {
    emit(LoginLoading());
    final eitherInput =
        await loginUseCase.call(LoginParams(email: email, password: password));
    eitherInput.fold(
        (failure) => emit(LoginError(errorMessage: failure.message)),
        (success) => emit(LoginLoaded(model: success)));
  }

  bool _isVisiblePassword = true;

  bool get getIsVisiblePassword => _isVisiblePassword;

  set setIsVisiblePassword(bool value) {
    emit(IsVisiblePasswordLoading());
    _isVisiblePassword = value;
    emit(IsVisiblePasswordLoaded());
  }

}
