import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/modules/onboarding/onboarding_screen.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper/dio_helper.dart';
import 'package:shop_app/shared/theme/light_theme.dart';

void main() {
  BlocObserver observer = MyBlocObserver();
  Bloc.observer = observer;
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: OnBoardingScreen(),
      theme: themeDataLight,
      debugShowCheckedModeBanner: false,
    );
  }
}
