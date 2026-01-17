import 'package:postly/core/app_dimentions/app_paddings.dart';
import 'package:postly/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppCardTheme {
  static final CardThemeData appCardTheme = CardThemeData(
    color: AppColors.cBgPrimary400,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppPaddings.kDefaultPadding),
    ),
    margin: EdgeInsets.symmetric(
      vertical: AppPaddings.kPaddingSmall,
      horizontal: AppPaddings.kPaddingMedium,
    ),
  );
}
