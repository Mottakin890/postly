import 'package:postly/core/app_dimentions/app_paddings.dart';
import 'package:postly/core/themes/app_colors.dart';
import 'package:postly/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class AppSnackbarTheme {
  static final SnackBarThemeData appSnackbarTheme = SnackBarThemeData(
    backgroundColor: AppColors.cBgPrimary400,
    contentTextStyle: AppTextStyles.bodyMediumRegular.copyWith(
      color: AppColors.cPrimary100,
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppPaddings.kDefaultPadding),
    ),
    actionTextColor: AppColors.cPrimary,
    closeIconColor: AppColors.cPrimary100,
    disabledActionTextColor: AppColors.cBgPrimary200,
  );
}
