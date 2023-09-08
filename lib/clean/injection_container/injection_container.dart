import 'package:get_it/get_it.dart';
import 'package:shop_app/clean/injection_container/injection_files/injection_login.dart';

GetIt sl = GetIt.instance;
Future<void> initDI() async {
  await loginInject();
}