import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/widget/oval_shape.dart';
import 'package:pharma/translations.dart';

class YourPointsBox extends StatelessWidget {
  final String points;
  final String pointsValue;
  const YourPointsBox(
      {super.key, required this.points, required this.pointsValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusApp.r8),
          boxShadow: [ColorManager.shadowGaryDownSoftOuter],
          border: Border.all(color: ColorManager.primaryGreen, width: 3)),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: OvalShape(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.points,
                    style: getRegularStyle(
                        color: ColorManager.white, fontSize: FontSizeApp.s18),
                  ),
                  Text(
                    points,
                    style: getBoldStyle(
                        color: ColorManager.white, fontSize: FontSizeApp.s26),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: const EdgeInsets.all(PaddingApp.p14),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.value_in_syrian_pounds,
                  style: getRegularStyle(
                      color: ColorManager.primaryGreen,
                      fontSize: FontSizeApp.s18),
                ),
                Text(
                  pointsValue,
                  style: getBoldStyle(
                      color: ColorManager.primaryGreen,
                      fontSize: FontSizeApp.s26),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
