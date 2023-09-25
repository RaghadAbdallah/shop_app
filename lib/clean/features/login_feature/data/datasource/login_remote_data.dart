import 'package:shop_app/clean/core/data/data_source/remote_data_source/network_helper.dart';
import '../../../../core/presentation/resource/endpoints.dart';
import '../model/login_model.dart';

abstract class LoginDataSource {
  Future<LoginModel> getLoginInfo(
      {required String email, required String password});
}

class LoginImplData implements LoginDataSource {
  @override
  Future<LoginModel> getLoginInfo(
      {required String email, required String password}) async {
    Map<String, dynamic> response = await NetworkHelper.postData(
        endPoint: LOGIN, query: {'email': email, 'password': password});

    final LoginModel json = LoginModel.fromJson(response);
    return json;
  }
}
