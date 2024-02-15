import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class NextRankProgressBar extends StatelessWidget {
  const NextRankProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingApp.p30, vertical: PaddingApp.p10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p10),
                child: SvgPicture.asset(
                  IconsManager.crown,
                  width: 30.w,
                  height: 30.h,
                  colorFilter: const ColorFilter.mode(
                      ColorManager.gold, BlendMode.srcIn),
                ),
              ),
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: LinearProgressIndicator(
                    color: ColorManager.primaryGreen,
                    value: .9,
                    minHeight: 24.h,
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          "100,000 ليرة سورية متبقية للحصول على الرتبة الذهبية",
          style: getRegularStyle(
              color: ColorManager.grayForMessage, fontSize: FontSizeApp.s13),
        ),
      ],
    );
  }
}
