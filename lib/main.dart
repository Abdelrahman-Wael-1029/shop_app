import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/modules/onboarding/onboarding_screen.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/constants/constant.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper/dio_helper.dart';
import 'package:shop_app/shared/theme/dark_theme.dart';
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
    return BlocProvider(
      create: (context) =>
      HomeCubit()
        ..getCategoryData()
        ..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            home: const OnBoardingScreen(),
            theme: themeDataLight,
            darkTheme: themeDataDark,
            themeMode: HomeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
