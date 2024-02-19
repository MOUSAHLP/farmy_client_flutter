import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/translations.dart';

class RewardsGuideNote extends StatelessWidget {
  final String expiration;
  const RewardsGuideNote({super.key, required this.expiration});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingApp.p5, vertical: PaddingApp.p8),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            AppLocalizations.of(context)!.note,
            style: getRegularStyle(
                color: ColorManager.redForFavorite, fontSize: FontSizeApp.s14),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: PaddingApp.p5, horizontal: PaddingApp.p10),
          margin: const EdgeInsets.symmetric(horizontal: PaddingApp.p5),
          decoration: BoxDecoration(
            color: ColorManager.lightGray,
            borderRadius: BorderRadius.circular(RadiusApp.r5),
          ),
          child: Text(
            AppLocalizations.of(context)!.all_points_expire_in_period +
                expiration +
                AppLocalizations.of(context)!
                    .all_points_will_expire_after_period,
            style: getRegularStyle(
              color: ColorManager.grayForMessage,
              fontSize: FontSizeApp.s14,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
