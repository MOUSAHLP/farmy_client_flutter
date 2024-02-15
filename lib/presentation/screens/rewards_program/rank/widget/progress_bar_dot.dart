import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class ProgressBarDot extends StatelessWidget {
  final String text;
  final String svg;
  final Color crownColor;
  final bool active;
  const ProgressBarDot({
    super.key,
    required this.text,
    required this.svg,
    required this.crownColor,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svg,
          width: 15.w,
          height: 15.h,
          colorFilter: ColorFilter.mode(crownColor, BlendMode.srcIn),
        ),
        SizedBox(
          height: 8.h,
        ),
        CircleAvatar(
          maxRadius: 6.w,
          backgroundColor: active
              ? ColorManager.primaryGreen
              : ColorManager.grayForSearchProduct,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          text,
          style: getRegularStyle(
              color: ColorManager.grayForMessage, fontSize: FontSizeApp.s10),
        ),
      ],
    );
  }
}
