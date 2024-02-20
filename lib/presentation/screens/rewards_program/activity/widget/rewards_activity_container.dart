import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/translations.dart';

class RewardsActivityContainer extends StatelessWidget {
  final String taskTitle;
  final String rewardText;
  final Function()? onTap;
  final List<Widget> tasks;
  const RewardsActivityContainer(
      {super.key,
      required this.taskTitle,
      required this.rewardText,
      required this.tasks,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: PaddingApp.p10),
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
            AppLocalizations.of(context)!.prize,
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
      ),
    );
  }
}
