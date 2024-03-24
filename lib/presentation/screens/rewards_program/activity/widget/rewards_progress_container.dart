import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class RewardsProgressContainer extends StatelessWidget {
  final bool active;

  const RewardsProgressContainer({super.key, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: PaddingApp.p5,
          vertical: PaddingApp.p8.h,
        ),
        height: 10.h,
        decoration: BoxDecoration(
          color: active
              ? ColorManager.primaryGreen
              : ColorManager.grayForSearchProduct,
          borderRadius: BorderRadius.circular(RadiusApp.r22),
        ),
      ),
    );
  }
}
