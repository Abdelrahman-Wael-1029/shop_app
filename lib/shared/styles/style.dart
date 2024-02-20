import 'package:flutter/material.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/shared/constants/constant.dart';

Color getColorPrice(context) {
  return HomeCubit.get(context).isDark
      ? AppColors.thirdColor
      : AppColors.fourthColor;
}

TextStyle? getHeadlineTextStyle(
  context,
) {
  var screenHeight = MediaQuery.of(context).size.width;

  if (screenHeight < 350) {
    return Theme.of(context).textTheme.headlineSmall;
  } else if (screenHeight < 900) {
    return Theme.of(context).textTheme.headlineMedium;
  }
  return Theme.of(context).textTheme.headlineLarge;
}

TextStyle? getDisplayTextStyle(
  context,
) {
  var screenHeight = MediaQuery.of(context).size.width;

  if (screenHeight < 350) {
    return Theme.of(context).textTheme.displaySmall;
  } else if (screenHeight < 900) {
    return Theme.of(context).textTheme.displayMedium;
  }
  return Theme.of(context).textTheme.displayLarge;
}

TextStyle? getBodyTextStyle(
  context,
) {
  var screenHeight = MediaQuery.of(context).size.width;
  if (screenHeight < 350) {
    return Theme.of(context).textTheme.bodySmall;
  } else if (screenHeight < 900) {
    return Theme.of(context).textTheme.bodyMedium;
  }
  return Theme.of(context).textTheme.bodyLarge;
}

TextStyle? getLabelTextStyle(
  context,
) {
  var screenHeight = MediaQuery.of(context).size.width;

  if (screenHeight < 350) {
    return Theme.of(context).textTheme.labelSmall;
  } else if (screenHeight < 700) {
    return Theme.of(context).textTheme.labelMedium;
  }
  return Theme.of(context).textTheme.labelLarge;
}

TextStyle? getTitelTextStyle(
  context,
) {
  var screenHeight = MediaQuery.of(context).size.width;

  if (screenHeight < 350) {
    return Theme.of(context).textTheme.titleSmall;
  } else if (screenHeight < 700) {
    return Theme.of(context).textTheme.titleMedium;
  }
  return Theme.of(context).textTheme.titleLarge;
}
