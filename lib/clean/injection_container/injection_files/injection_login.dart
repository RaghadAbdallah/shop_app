import 'package:shop_app/clean/features/login_feature/data/datasource/login_remote_data.dart';
import 'package:shop_app/clean/features/login_feature/data/repository_impl/login_repository_impl.dart';
import 'package:shop_app/clean/features/login_feature/domain/repository/login_repository.dart';
import 'package:shop_app/clean/features/login_feature/domain/usecase/login_usecase.dart';
import 'package:shop_app/clean/features/login_feature/presentation/cubit/login_cubit.dart';
import 'package:shop_app/clean/injection_container/injection_container.dart';

Future<void> loginInject()async{
  // cubit
  sl.registerFactory(() => LoginCubit(loginUseCase: sl()));

  // repository
  sl.registerLazySingleton<LoginRepository>(
          () => LoginRepositoryImpl(loginDataSource: sl()));

  // remote data source
  sl.registerLazySingleton<LoginDataSource>(
          () => LoginImplData());

  // use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
}