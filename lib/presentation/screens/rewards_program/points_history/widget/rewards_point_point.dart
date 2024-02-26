import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/translations.dart';

class RewardsPointPoint extends StatelessWidget {
  final String point;
  final bool expired;

  const RewardsPointPoint(
      {super.key, required this.point, this.expired = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingApp.p10),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: PaddingApp.p14),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Column(
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
                    AppLocalizations.of(context)!.point,
                    style: getBoldStyle(
                        color: expired
                            ? ColorManager.redForFavorite
                            : ColorManager.primaryGreen,
                        fontSize: FontSizeApp.s12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: PaddingApp.p18),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: ColorManager.grayForSearch, width: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
