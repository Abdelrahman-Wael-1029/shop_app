import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shop_app/layout/home_layout/cubit/home_cubit.dart';
import 'package:shop_app/shared/constants/constant.dart';

Color getColorPrice(context) {
  return HomeCubit.get(context).isDark
      ? AppColors.thirdColor
      : AppColors.fourthColor;
}
