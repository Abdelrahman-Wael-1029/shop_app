import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constant.dart';

const backgroundColor = Color(0xFF2B2B2C);

ThemeData themeDataDark = ThemeData(
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
    surface: Colors.white,
    primary: AppColors.primaryColor,
    onBackground: Colors.white,
  ),
  indicatorColor: AppColors.fourthColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor,
    foregroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
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
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(AppColors.fourthColor),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
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
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: backgroundColor,
    selectedItemColor: AppColors.secondaryColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    elevation: 20,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 20.0,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 20.0,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
