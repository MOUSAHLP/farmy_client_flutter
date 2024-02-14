import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/rewards_bloc1/rewards_bloc.dart';
import 'package:pharma/bloc/rewards_bloc1/rewards_event.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/activity_widget/rewards_activity_container.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/activity_widget/rewards_progress_container.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_row.dart';

class RewardsactivityScreen extends StatelessWidget {
  const RewardsactivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RewardsFilterRow(rewardsFilterBoxArray: [
          Expanded(
              child: InkWell(
                  onTap: () {
                    context
                        .read<RewardsBloc>()
                        .add(ChangeTabActivityEvent(tabNumber: 1));
                  },
                  child: RewardsFilterBox(text: "الأنشطة", isActive: true))),
          Expanded(
              child: InkWell(
                  onTap: () {
                    context
                        .read<RewardsBloc>()
                        .add(ChangeTabActivityEvent(tabNumber: 2));
                  },
                  child: RewardsFilterBox(text: "العروض", isActive: true))),
        ]),
        // RewardsActivityContainer(
        //     taskTitle: "عند إضافة ميلادك ستحصل على 100 نقطة",
        //     rewardText: "أضف عيد ميلادك في التفاصيل الشخصية في “حسابي”",
        //     tasks: [
        //       RewardsProgressContainer(
        //         active: true,
        //       ),
        //       RewardsProgressContainer(),
        //       RewardsProgressContainer(),
        //     ]),
        // RewardsActivityContainer(
        //     taskTitle:
        //         "عند إضافة ميلادك ستحصل على 100 نقطة عند إضافة ميلادك ستحصل على 100 نقطة",
        //     rewardText: "أضف عيد ميلادك في التفاصيل الشخصية في “حسابي” ",
        //     tasks: [
        //       RewardsProgressContainer(
        //         active: true,
        //       ),
        //       RewardsProgressContainer(
        //         active: true,
        //       ),
        //       RewardsProgressContainer(),
        //     ]),

        Container(
            margin: const EdgeInsets.symmetric(
                horizontal: PaddingApp.p16, vertical: PaddingApp.p10),
            padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusApp.r8),
              color: Colors.white,
              boxShadow: [
                ColorManager.shadowGaryDown,
              ],
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(
                      color: ColorManager.grayForSearch,
                      width: 1,
                    )),
                  ),
                  padding: EdgeInsets.all(PaddingApp.p14),
                  child: Column(
                    children: [
                      Image.asset(ImageManager.dateTimeImage),
                      Text("حسم")
                    ],
                  ),
                )
              ],
            )),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [ColorManager.shadowGaryDownSoft]),
            ),
            Positioned(
                left: -15,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                )),
            Positioned(
                right: -15,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                )),
          ],
        )
      ],
    );
  }
}
