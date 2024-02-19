import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/translations.dart';

class YourRank extends StatelessWidget {
  const YourRank({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(PaddingApp.p8),
          width: 130.w,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.srcIn,
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(RadiusApp.r20),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(2, 0),
                    color: ColorManager.black.withOpacity(.1),
                    blurStyle: BlurStyle.inner),
                BoxShadow(
                    offset: const Offset(2, 4),
                    color: ColorManager.black.withOpacity(.1),
                    blurStyle: BlurStyle.inner),
                const BoxShadow(
                    offset: Offset(0, 2),
                    color: ColorManager.white,
                    spreadRadius: -1,
                    blurRadius: 2,
                    blurStyle: BlurStyle.inner),
              ]),
          child: Text(
            AppLocalizations.of(context)!.your_rank,
            style: getUnderBoldStyle(
                color: ColorManager.grayForMessage, fontSize: FontSizeApp.s14),
          ),
        ),
        Positioned(
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(PaddingApp.p8),
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(RadiusApp.r20),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2, 0),
                        color: ColorManager.black.withOpacity(.1),
                        blurStyle: BlurStyle.inner),
                    BoxShadow(
                        offset: const Offset(2, 4),
                        color: ColorManager.black.withOpacity(.1),
                        blurStyle: BlurStyle.inner),
                    const BoxShadow(
                        offset: Offset(0, 2),
                        color: ColorManager.white,
                        spreadRadius: -1,
                        blurRadius: 2,
                        blurStyle: BlurStyle.inner),
                  ]),
              child: SvgPicture.asset(
                IconsManager.crown,
              ),
            )),
      ],
    );
  }
}
