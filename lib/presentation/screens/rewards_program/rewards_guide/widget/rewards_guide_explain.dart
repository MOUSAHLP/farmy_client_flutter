import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class RewardsGuideExplain extends StatelessWidget {
  final String title;
  final String explain;
  const RewardsGuideExplain(
      {super.key, required this.title, required this.explain});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingApp.p10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getUnderBoldStyle(
                color: ColorManager.grayForMessage, fontSize: FontSizeApp.s14),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            explain,
            style: getRegularStyle(
                color: ColorManager.grayForMessage, fontSize: FontSizeApp.s14),
          ),
        ],
      ),
    );
  }
}
