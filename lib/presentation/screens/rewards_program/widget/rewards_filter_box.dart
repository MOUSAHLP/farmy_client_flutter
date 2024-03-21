import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class RewardsFilterBox extends StatelessWidget {
  final String text;
  final bool isActive;

  const RewardsFilterBox({
    super.key,
    required this.text,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107.w,
      padding: EdgeInsets.symmetric(vertical: PaddingApp.p5.h),
      margin: EdgeInsets.symmetric(horizontal: PaddingApp.p8.w),
      decoration: BoxDecoration(
        color: isActive ? ColorManager.primaryGreen : Colors.white,
        borderRadius: BorderRadius.circular(RadiusApp.r10.r),
        border: Border.all(
          color: ColorManager.primaryGreen,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: getUnderBoldStyle(
          color: isActive ? ColorManager.white : ColorManager.primaryGreen,
          fontSize: FontSizeApp.s12.sp,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
