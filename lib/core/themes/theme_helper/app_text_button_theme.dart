import 'package:postly/core/app_dimentions/app_paddings.dart';
import 'package:postly/core/themes/app_colors.dart';
import 'package:postly/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextButtonTheme {
  static final TextButtonThemeData appTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.cPrimary,
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddings.kPaddingMedium,
        vertical: AppPaddings.kPaddingSmall,
      ),
      textStyle: AppTextStyles.bodyLargeSemibold,
    ),
  );
}
