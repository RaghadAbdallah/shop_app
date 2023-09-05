import 'package:flutter/material.dart';
import 'clean/core/data/data_source/remote_data_source/network_helper.dart';
import 'clean/features/on_boarding_feature/presentation/page/on_boarding_screen.dart';

void main() {
  NetworkHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent
        )
      ),
      home: OnBoardingScreen(),
    );
  }
}

