import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/widget/rewards_guide_explain.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/widget/rewards_guide_note.dart';

class RewardsGuideWidget extends StatelessWidget {
  const RewardsGuideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingApp.p20, vertical: PaddingApp.p10),
            child: Column(
              children: [
                const RewardsGuideExplain(
                  title: "برنامج مكافآت العملاء “مرحبا”",
                  explain:
                      "تم تصميم برنامج المكافآت ”مرحباً“ لعملائنا الدائمين تقديراً و امتناناً لكونهم جزءاً أصيلاً من عائلة فارمي و جزءاً لا يتجزأ من قصة نجاحنا التي لم تكن لتكتب لولا عملائنا المميزين بمجرد تحميل التطبيق و التسجيل به ستبدأ رحلتك مع النقاط الفورية و الهدايا القيّمة.",
                ),
                const RewardsGuideExplain(
                  title: "كيف يمكنني استبدال النقاط ؟",
                  explain:
                      "في مرحلة تسديد قيمة الطلب، سيمكنك بكل سهولة اختيار ”استبدال نقاط“ و اختيار عدد النقاط التي ترغب باستبدالها و سيظهر لك تلقائياً قيمة الحسم المكافئ للنقاط المستبدلة. من الممكن أن تتغير قيمة النقاط المستبدلة من وقت لآخر وفقاً لمتغيرات السوق. بشكل عام و في الوقت الحالي فإن عملية استبدال النقاط ستخولك الحصول على الحسومات التالية:",
                ),
                SizedBox(
                  height: 10.h,
                ),
                const RewardsGuideNote(expiration: "/ 90 / يوماً"),
              ],
            ))
      ],
    );
  }
}
