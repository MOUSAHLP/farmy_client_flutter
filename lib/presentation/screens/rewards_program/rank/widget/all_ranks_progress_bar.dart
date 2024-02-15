import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/widget/progress_bar_dot.dart';

class AllRanksProgressBar extends StatelessWidget {
  const AllRanksProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: LinearProgressIndicator(
              minHeight: 2,
              backgroundColor: ColorManager.grayForSearchProduct,
              value: .5,
              valueColor:
                  AlwaysStoppedAnimation<Color>(ColorManager.primaryGreen),
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            ProgressBarDot(
              text: "Bronze",
              svg: IconsManager.crown,
              crownColor: ColorManager.bronze,
              active: true,
            ),
            ProgressBarDot(
              text: "Silver",
              svg: IconsManager.crown,
              crownColor: ColorManager.silver,
              active: true,
            ),
            ProgressBarDot(
              text: "Gold",
              svg: IconsManager.crown,
              crownColor: ColorManager.gold,
              active: true,
            ),
            ProgressBarDot(
              text: "Platinium",
              svg: IconsManager.crown,
              crownColor: ColorManager.platinium,
            ),
            ProgressBarDot(
              text: "VIP",
              svg: IconsManager.crown,
              crownColor: ColorManager.vip,
            ),
            ProgressBarDot(
              text: "VIP Plus",
              svg: IconsManager.crown,
              crownColor: ColorManager.vipPlus,
            ),
          ],
        )
      ],
    );
  }
}
