import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class RewardsFilterBox extends StatelessWidget {
  final String text;
  final bool isActive;
  const RewardsFilterBox(
      {super.key, required this.text, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: PaddingApp.p5),
      margin: const EdgeInsets.symmetric(horizontal: PaddingApp.p10),
      decoration: BoxDecoration(
          color: isActive ? ColorManager.primaryGreen : Colors.white,
          borderRadius: BorderRadius.circular(RadiusApp.r10),
          border: Border.all(color: ColorManager.primaryGreen, width: 1)),
      child: Text(
        text,
        style: getUnderBoldStyle(
          color: isActive ? ColorManager.white : ColorManager.primaryGreen,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
