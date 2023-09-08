import 'dart:convert';
import 'dart:developer';

import 'package:shop_app/clean/core/data/data_source/remote_data_source/network_helper.dart';

import '../../../../core/presentation/resource/endpoints.dart';

abstract class LoginDataSource {
  Future<void> getLoginInfo({required String email, required String password});
}

class LoginImplData implements LoginDataSource {
  @override
  Future<void> getLoginInfo(
      {required String email, required String password}) async {
    final response = await NetworkHelper.postData(
        endPoint: LOGIN,
        query: {'email': email, 'password': password}).then((value) {
      log(value.toString());
    });
    log('----->${response}');
    return response;
  }
}
