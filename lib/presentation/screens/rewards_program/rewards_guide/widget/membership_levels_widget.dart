import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/widget/membership_level_explain.dart';

class MembershipLevelsWidget extends StatelessWidget {
  const MembershipLevelsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p20, vertical: PaddingApp.p10),
      child: ListView(
        children: [
          Text(
            "تتعدد مستويات العضوية و ميزات كل منها في فارمي، بما يعكس التقدير العميق الذي نشعر به تجاه جميع عملائنا بشكل عام و الدائمين بشكل خاص. لقد قمنا بتصميم برنامج خاص للعضوية يمنح كل رتبة أو مستوى مميزات و حسومات و هدايا مجانية لعملائنا الرائعين.",
            style: getUnderBoldStyle(
              color: ColorManager.grayForMessage,
              fontSize: FontSizeApp.s14,
              height: 1.6,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return const MembershipLevelExplain(
                  level: "Platinium",
                  explain:
                      "You get this rank when you subscribe to the application for the first time.",
                  features: ["gregre", "few"],
                  crownColor: ColorManager.platinium,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: ColorManager.lightGray,
                  )),
                );
              },
              itemCount: 3),
          SizedBox(
            height: 15.h,
          )
        ],
      ),
    );
  }
}
