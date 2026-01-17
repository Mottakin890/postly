import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postly/core/themes/app_colors.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTapAction;
  const MyButton({
    super.key,
    required this.buttonName,
    required this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapAction,
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.cPrimary,
          borderRadius: .circular(22.r),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: AppColors.cBgPrimary500,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
