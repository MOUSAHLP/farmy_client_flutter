import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class RewardsActivityContainer extends StatelessWidget {
  final String taskTitle;
  final String rewardText;
  final List<Widget> tasks;
  const RewardsActivityContainer(
      {super.key,
      required this.taskTitle,
      required this.rewardText,
      required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p16, vertical: PaddingApp.p10),
      padding: const EdgeInsets.all(PaddingApp.p10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusApp.r8),
        color: Colors.white,
        boxShadow: [
          ColorManager.shadowGaryDown,
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          taskTitle,
          style: getUnderBoldStyle(
              color: ColorManager.grayForMessage, fontSize: FontSizeApp.s14),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "الجائزة:",
          style: getBoldStyle(
              color: ColorManager.primaryGreen, fontSize: FontSizeApp.s14),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          rewardText,
          style: getRegularStyle(
              color: ColorManager.grayForMessage, fontSize: FontSizeApp.s14),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: tasks,
        )
      ]),
    );
  }
}
