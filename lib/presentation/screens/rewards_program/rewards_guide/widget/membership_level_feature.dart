import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/models/reward/reward_membership_guide_model.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class MembershipLevelFeature extends StatelessWidget {
  final String feature;
  const MembershipLevelFeature({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 5,
          height: 5,
          decoration: const BoxDecoration(
            color: ColorManager.grayForMessage,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: Text(
            feature,
            style: getRegularStyle(
              color: ColorManager.grayForMessage,
              fontSize: FontSizeApp.s13,
            ),
          ),
        ),
      ],
    );
  }
}
