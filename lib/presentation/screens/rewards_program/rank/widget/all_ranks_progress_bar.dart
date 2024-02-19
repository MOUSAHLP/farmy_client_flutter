import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/widget/progress_bar_dot.dart';
import 'package:pharma/translations.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            ProgressBarDot(
              text: AppLocalizations.of(context)!.bronze,
              svg: IconsManager.crown,
              crownColor: ColorManager.bronze,
              active: true,
            ),
            ProgressBarDot(
              text: AppLocalizations.of(context)!.silver,
              svg: IconsManager.crown,
              crownColor: ColorManager.silver,
              active: true,
            ),
            ProgressBarDot(
              text: AppLocalizations.of(context)!.gold,
              svg: IconsManager.crown,
              crownColor: ColorManager.gold,
              active: true,
            ),
            ProgressBarDot(
              text: AppLocalizations.of(context)!.platinium,
              svg: IconsManager.crown,
              crownColor: ColorManager.platinium,
            ),
            ProgressBarDot(
              text: AppLocalizations.of(context)!.vip,
              svg: IconsManager.crown,
              crownColor: ColorManager.vip,
            ),
            ProgressBarDot(
              text: AppLocalizations.of(context)!.vip_plus,
              svg: IconsManager.crown,
              crownColor: ColorManager.vipPlus,
            ),
          ],
        )
      ],
    );
  }
}
