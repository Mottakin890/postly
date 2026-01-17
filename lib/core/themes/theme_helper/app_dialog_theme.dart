import 'package:postly/core/app_dimentions/app_paddings.dart';
import 'package:postly/core/themes/app_colors.dart';
import 'package:postly/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class AppDialogTheme {
  static final DialogThemeData appDialogTheme = DialogThemeData(
    backgroundColor: AppColors.cBgPrimary400,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppPaddings.kPaddingMedium),
    ),
    titleTextStyle: AppTextStyles.heading5.copyWith(
      color: AppColors.cPrimary100,
    ),
    contentTextStyle: AppTextStyles.bodyMediumRegular.copyWith(
      color: AppColors.cBgPrimary100,
    ),
  );
}
