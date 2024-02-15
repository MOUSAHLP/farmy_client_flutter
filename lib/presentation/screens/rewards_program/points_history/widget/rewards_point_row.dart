import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class RewardsPointRow extends StatelessWidget {
  final String text;
  final String date;
  final bool expired;
  const RewardsPointRow(
      {super.key,
      required this.text,
      required this.date,
      this.expired = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingApp.p5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: getUnderBoldStyle(
                color: expired
                    ? ColorManager.redForFavorite
                    : ColorManager.grayForMessage,
                fontSize: FontSizeApp.s12),
          ),
          Text(
            date,
            style: getUnderBoldStyle(
                color: expired
                    ? ColorManager.redForFavorite
                    : ColorManager.grayForMessage,
                fontSize: FontSizeApp.s12),
          )
        ],
      ),
    );
  }
}
