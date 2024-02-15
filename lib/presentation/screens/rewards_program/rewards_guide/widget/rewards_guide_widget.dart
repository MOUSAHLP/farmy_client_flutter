import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/widget/rewards_guide_explain.dart';

class RewardsGuideWidget extends StatelessWidget {
  const RewardsGuideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: PaddingApp.p18, vertical: PaddingApp.p10),
            child: Column(
              children: [
                RewardsGuideExplain(
                  title: "برنامج مكافآت العملاء “مرحبا”",
                  explain:
                      "تم تصميم برنامج المكافآت ”مرحباً“ لعملائنا الدائمين تقديراً و امتناناً لكونهم جزءاً أصيلاً من عائلة فارمي و جزءاً لا يتجزأ من قصة نجاحنا التي لم تكن لتكتب لولا عملائنا المميزين بمجرد تحميل التطبيق و التسجيل به ستبدأ رحلتك مع النقاط الفورية و الهدايا القيّمة.",
                ),
                RewardsGuideExplain(
                  title: "برنامج مكافآت العملاء “مرحبا”",
                  explain:
                      "تم تصميم برنامج المكافآت ”مرحباً“ لعملائنا الدائمين تقديراً و امتناناً لكونهم جزءاً أصيلاً من عائلة فارمي و جزءاً لا يتجزأ من قصة نجاحنا التي لم تكن لتكتب لولا عملائنا المميزين بمجرد تحميل التطبيق و التسجيل به ستبدأ رحلتك مع النقاط الفورية و الهدايا القيّمة.",
                ),
                RewardsGuideExplain(
                  title: "برنامج مكافآت العملاء “مرحبا”",
                  explain:
                      "تم تصميم برنامج المكافآت ”مرحباً“ لعملائنا الدائمين تقديراً و امتناناً لكونهم جزءاً أصيلاً من عائلة فارمي و جزءاً لا يتجزأ من قصة نجاحنا التي لم تكن لتكتب لولا عملائنا المميزين بمجرد تحميل التطبيق و التسجيل به ستبدأ رحلتك مع النقاط الفورية و الهدايا القيّمة.",
                ),
              ],
            ))
      ],
    );
  }
}
