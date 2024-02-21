import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/constants/constant.dart';

ThemeData themeDataLight = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
  ),
  indicatorColor: AppColors.fourthColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.fourthColor),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      ),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,

    ),
    displayMedium: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,

    ),
    displaySmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),

    bodyLarge: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),

    headlineLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),

    labelLarge: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),

    titleLarge: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
    ),

    titleMedium: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
    ),

    titleSmall: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(AppColors.fourthColor),

    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(AppColors.fourthColor),
      side: MaterialStateProperty.all(
        const BorderSide(
          color: AppColors.fourthColor,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),


    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.secondaryColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    elevation: 20,
  ),
  searchBarTheme: SearchBarThemeData(
    backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
    elevation: MaterialStateProperty.all(0),
  ),
);
