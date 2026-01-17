import 'package:postly/core/themes/app_colors.dart';
import 'package:postly/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class BottomNavigationThemeD {
  static final BottomNavigationBarThemeData bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
        backgroundColor: AppColors.cBgPrimary400,
        selectedItemColor: AppColors.cPrimary,
        unselectedItemColor: AppColors.cBgPrimary100,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: AppTextStyles.bodySmallSemibold,
        unselectedLabelStyle: AppTextStyles.bodySmallRegular,
      );
}
