import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/rewards_bloc/activity_bloc/rewards_activity_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/activity_bloc/rewards_activity_event.dart';
import 'package:pharma/bloc/rewards_bloc/activity_bloc/rewards_activity_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_container.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_buy.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_code.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_progress_container.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_row.dart';
import 'package:pharma/presentation/widgets/dialogs/rewards_point_dialog.dart';
import 'package:pharma/translations.dart';

class RewardsactivityScreen extends StatelessWidget {
  const RewardsactivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RewardsActivityBloc, RewardsActivityState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p16),
            child: Column(
              children: [
                RewardsFilterRow(rewardsFilterBoxArray: [
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            context.read<RewardsActivityBloc>().add(
                                ChangeTabActivityEvent(
                                    currentScreen:
                                        RewardsActivityStateEnum.activity));
                          },
                          child: RewardsFilterBox(
                              text: AppLocalizations.of(context)!.activities,
                              isActive: context
                                      .read<RewardsActivityBloc>()
                                      .currentScreen ==
                                  RewardsActivityStateEnum.activity))),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          context.read<RewardsActivityBloc>().add(
                              ChangeTabActivityEvent(
                                  currentScreen:
                                      RewardsActivityStateEnum.offers));
                        },
                        child: RewardsFilterBox(
                            text: AppLocalizations.of(context)!.offers,
                            isActive: context
                                    .read<RewardsActivityBloc>()
                                    .currentScreen ==
                                RewardsActivityStateEnum.offers)),
                  ),
                ]),
                Expanded(
                    child: ListView(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    if (context.read<RewardsActivityBloc>().currentScreen ==
                        RewardsActivityStateEnum.activity) ...[
                      RewardsActivityContainer(
                          onTap: () {
                            RewardsPointDialog.openDialog(context, "1000");
                          },
                          taskTitle: "عند إضافة ميلادك ستحصل على 1000 نقطة",
                          rewardText:
                              "أضف عيد ميلادك في التفاصيل الشخصية في “حسابي”",
                          tasks: const [
                            RewardsProgressContainer(
                              active: true,
                            ),
                            RewardsProgressContainer(),
                            RewardsProgressContainer(),
                          ]),

                    ] else ...[
                      const RewardsActivityTicketBuy(
                          text:
                              "احصل على حسم 50% لفترة محدودة استفيد من العرض قبل انتهاءه",
                          point: "1500",
                          imageText: "imageText",
                          imagePath: "imagePath"),
                      SizedBox(
                        height: 20.h,
                      ),
                      const RewardsActivityTicketCode(
                          text:
                              "احصل على حسم 50% لفترة محدودة استفيد من العرض قبل انتهاءه",
                          code: "AB12345C",
                          codeValidity: "2024/4/1",
                          imageText: "imageText",
                          imagePath: "imagePath"),
                      SizedBox(
                        height: 200.h,
                      ),
                    ],
                  ],
                )),
              ],
            ),
          );
        });
  }
}
