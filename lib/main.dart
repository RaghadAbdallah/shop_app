import 'package:flutter/material.dart';
import 'package:shop_app/clean/features/login_feature/presentation/cubit/login_cubit.dart';
import 'package:shop_app/clean/injection_container/injection_container.dart'as di;
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_bloc/src/multi_bloc_provider.dart';
import 'clean/core/data/data_source/remote_data_source/network_helper.dart';
import 'clean/features/on_boarding_feature/presentation/page/on_boarding_screen.dart';

void main() async{
  NetworkHelper.init();
  await di.initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<LoginCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                elevation: 0, backgroundColor: Colors.transparent)),
        home: const OnBoardingScreen(),
      ),
    );
  }
}
