import 'package:postly/core/app_dimentions/app_paddings.dart';
import 'package:postly/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppDrawerTheme {
  static final DrawerThemeData appDrawerTheme = DrawerThemeData(
    backgroundColor: AppColors.cBgPrimary,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(AppPaddings.kPaddingMedium),
      ),
    ),
    surfaceTintColor: AppColors.cPrimary,
  );
}
