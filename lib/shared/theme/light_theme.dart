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
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(AppColors.fourthColor),

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


