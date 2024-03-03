import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/translations.dart';

class RewardsActivityTicketBuyContent extends StatelessWidget {
  final String point;
  const RewardsActivityTicketBuyContent({Key? key, required this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingApp.p22, vertical: PaddingApp.p3),
          decoration: BoxDecoration(
              color: ColorManager.grayForMessage,
              borderRadius: BorderRadius.circular(RadiusApp.r5)),
          child: Text(
            "$point ${AppLocalizations.of(context)!.point}",
            style: getBoldStyle(
                color: ColorManager.white,
                fontSize: FontSizeApp.s18,
                height: 1.6),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(PaddingApp.p3),
          decoration: BoxDecoration(
              color: ColorManager.primaryGreen,
              borderRadius: BorderRadius.circular(RadiusApp.r5)),
          child: Text("شراء",
              style: getBoldStyle(
                  color: ColorManager.white,
                  fontSize: FontSizeApp.s14,
                  height: 1.6)),
        ),
      ],
    );
  }
}
