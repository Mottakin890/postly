import 'package:flutter/material.dart';
import 'package:postly/core/app_dimentions/app_paddings.dart';
import 'package:postly/core/themes/app_colors.dart';
import 'package:postly/core/themes/app_text_style.dart';

class AppBannerTheme {
  static final MaterialBannerThemeData appBannerTheme = MaterialBannerThemeData(
    backgroundColor: AppColors.cWarning.withValues(alpha: 0.1),
    contentTextStyle: AppTextStyles.bodyMediumRegular.copyWith(
      color: AppColors.cPrimary100,
    ),
    elevation: 0,
    padding: EdgeInsets.all(AppPaddings.kPaddingMedium),
    leadingPadding: EdgeInsets.only(right: AppPaddings.kPaddingMedium),
  );
}
