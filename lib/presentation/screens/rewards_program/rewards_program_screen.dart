import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';

class RewardsProgramScreen extends StatelessWidget {
  const RewardsProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBarScreen(sectionName: "برنامج المكافئات"),
            Container(
              height: 181,
              width: 1.sw,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                      color: const Color(0xFF000000).withOpacity(0.18),
                    )
                  ],
                  borderRadius: BorderRadius.circular(6),
                  border:
                      Border.all(width: 3, color: ColorManager.primaryGreen)),
              child: Column(children: [
                Container(
                  width: 1.sw,
                  height: 99,
                  decoration: const BoxDecoration(
                    color: ColorManager.primaryGreen,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(100),
                        bottomEnd: Radius.circular(100)),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 24,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46),
                child: LinearProgressBar(
                  maxSteps: 100,
                  progressType: LinearProgressBar.progressTypeLinear,
                  currentStep: 50,
                  progressColor: ColorManager.primaryGreen,
                  backgroundColor: ColorManager.grayForMessage,
                  dotsAxis: Axis.horizontal, // OR Axis.vertical
                  dotsActiveSize: 10,
                  dotsInactiveSize: 10,
                  dotsSpacing: const EdgeInsets.only(
                      right: 10), // also can use any EdgeInsets.
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
