import 'package:flutter/material.dart';
import 'package:postly/core/themes/app_colors.dart';

class AppActionIconTheme {
  static final ActionIconThemeData actionIconTheme = ActionIconThemeData(
    backButtonIconBuilder: (context) =>
        Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.cPrimary100),
    closeButtonIconBuilder: (context) =>
        Icon(Icons.close, color: AppColors.cPrimary100),
    drawerButtonIconBuilder: (context) =>
        Icon(Icons.menu, color: AppColors.cPrimary100),
    endDrawerButtonIconBuilder: (context) =>
        Icon(Icons.menu, color: AppColors.cPrimary100),
  );
}
