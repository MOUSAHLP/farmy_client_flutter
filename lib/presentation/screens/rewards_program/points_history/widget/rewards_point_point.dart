import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class RewardsPointPoint extends StatelessWidget {
  final String point;
  final bool expired;

  const RewardsPointPoint(
      {super.key, required this.point, this.expired = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingApp.p10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p14),
        decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(color: ColorManager.grayForSearch, width: 1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              point,
              style: getBoldStyle(
                  color: expired
                      ? ColorManager.redForFavorite
                      : ColorManager.primaryGreen,
                  fontSize: FontSizeApp.s26),
              textAlign: TextAlign.center,
            ),
            Text(
              "نقطة",
              style: getBoldStyle(
                  color: expired
                      ? ColorManager.redForFavorite
                      : ColorManager.primaryGreen,
                  fontSize: FontSizeApp.s12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
