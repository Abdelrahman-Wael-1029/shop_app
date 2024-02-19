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
    iconTheme: IconThemeData(
        // color: Colors.black,
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
      color: AppColors.primaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
    ),
    displaySmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
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
);

TextStyle? getHeadlineTextStyle(
  context, {
  required int screenHeight,
}) {
  if (screenHeight < 480) {
    return Theme.of(context).textTheme.headlineSmall;
  } else if (screenHeight < 900) {
    return Theme.of(context).textTheme.headlineMedium;
  }
  return Theme.of(context).textTheme.headlineLarge;
}

TextStyle? getDisplayTextStyle(
  context, {
  required int screenHeight,
}) {
  if (screenHeight < 480) {
    return Theme.of(context).textTheme.displaySmall;
  } else if (screenHeight < 900) {
    return Theme.of(context).textTheme.displayMedium;
  }
  return Theme.of(context).textTheme.displayLarge;
}

TextStyle? getBodyTextStyle(
  context, {
  required int screenHeight,
}) {
  if (screenHeight < 480) {
    return Theme.of(context).textTheme.bodySmall;
  } else if (screenHeight < 900) {
    return Theme.of(context).textTheme.bodyMedium;
  }
  return Theme.of(context).textTheme.bodyLarge;
}

TextStyle? getLabelTextStyle(
  context, {
  required int screenHeight,
}) {
  if (screenHeight < 480) {
    return Theme.of(context).textTheme.labelSmall;
  } else if (screenHeight < 700) {
    return Theme.of(context).textTheme.labelMedium;
  }
  return Theme.of(context).textTheme.labelLarge;
}


