import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_event.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_container.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_buy.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_my_coupon.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_progress_container.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_row.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:pharma/presentation/widgets/dialogs/rewards_point_dialog.dart';
import 'package:pharma/translations.dart';

class RewardsActivityAndOffersScreen extends StatelessWidget {
  RewardsActivityAndOffersScreen({super.key});

  final rewardsActivityAndOffersBloc = RewardsActivityAndOffersBloc();

  @override
  Widget build(BuildContext context) {
    rewardsActivityAndOffersBloc.add(GetActivityRewards());
    return BlocConsumer<RewardsActivityAndOffersBloc,
        RewardsActivityAndOffersState>(
      bloc: rewardsActivityAndOffersBloc,
      listener: (context, state) {
        if (state.isLoading) {
          LoadingDialog().openDialog(context);
        }
        if (state.isSuccess) {
          LoadingDialog().closeDialog(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingApp.p16.w,
          ),
          child: Column(
            children: [
              RewardsFilterRow(
                rewardsFilterBoxArray: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        rewardsActivityAndOffersBloc.add(GetActivityRewards());
                        rewardsActivityAndOffersBloc.add(
                          ChangeTabActivityEvent(
                            currentScreen: RewardsActivityStateEnum.activity,
                          ),
                        );
                      },
                      child: RewardsFilterBox(
                        text: AppLocalizations.of(context)!.activities,
                        isActive: rewardsActivityAndOffersBloc.currentScreen ==
                            RewardsActivityStateEnum.activity,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        rewardsActivityAndOffersBloc.add(GetOffersRewards());

                        rewardsActivityAndOffersBloc.add(
                          ChangeTabActivityEvent(
                            currentScreen: RewardsActivityStateEnum.offers,
                          ),
                        );
                      },
                      child: RewardsFilterBox(
                        text: AppLocalizations.of(context)!.offers,
                        isActive: rewardsActivityAndOffersBloc.currentScreen ==
                            RewardsActivityStateEnum.offers,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        rewardsActivityAndOffersBloc.add(GetMyCouponRewards());
                        rewardsActivityAndOffersBloc.add(
                          ChangeTabActivityEvent(
                            currentScreen: RewardsActivityStateEnum.myCoupon,
                          ),
                        );
                      },
                      child: RewardsFilterBox(
                        text: AppLocalizations.of(context)!.my_coupon,
                        isActive: rewardsActivityAndOffersBloc.currentScreen ==
                            RewardsActivityStateEnum.myCoupon,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 10.h),
                    if (rewardsActivityAndOffersBloc.currentScreen ==
                        RewardsActivityStateEnum.activity) ...[
                      RewardsActivityContainer(
                        rewardsActivityAndOffersBloc:
                            rewardsActivityAndOffersBloc,
                      ),
                    ] else if ((rewardsActivityAndOffersBloc.currentScreen ==
                        RewardsActivityStateEnum.offers)) ...[
                      const RewardsActivityTicketBuyOffers(
                        text:
                            "احصل على حسم 50% لفترة محدودة استفيد من العرض قبل انتهاءه",
                        point: "1500",
                        imageText: "حسم",
                        imagePath: "imagePath",
                      ),
                    ] else ...[
                      RewardsActivityTicketMyCoupon(
                        rewardsActivityAndOffersBloc:
                            rewardsActivityAndOffersBloc,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
