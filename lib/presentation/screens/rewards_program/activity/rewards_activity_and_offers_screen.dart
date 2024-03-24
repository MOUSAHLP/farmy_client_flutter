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
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_row.dart';
import 'package:pharma/translations.dart';

class RewardsActivityAndOffersScreen extends StatelessWidget {
  const RewardsActivityAndOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardsActivityAndOffersBloc,
        RewardsActivityAndOffersState>(
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
                        context.read<RewardsActivityAndOffersBloc>().add(GetActivityRewards());
                        context.read<RewardsActivityAndOffersBloc>().add(
                              ChangeTabActivityEvent(
                                currentScreen:
                                    RewardsActivityStateEnum.activity,
                              ),
                            );
                      },
                      child: RewardsFilterBox(
                        text: AppLocalizations.of(context)!.activities,
                        isActive: context
                                .read<RewardsActivityAndOffersBloc>()
                                .currentScreen ==
                            RewardsActivityStateEnum.activity,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<RewardsActivityAndOffersBloc>().add(GetOffersRewards());
                        context.read<RewardsActivityAndOffersBloc>().add(
                              ChangeTabActivityEvent(
                                currentScreen: RewardsActivityStateEnum.offers,
                              ),
                            );
                      },
                      child: RewardsFilterBox(
                        text: AppLocalizations.of(context)!.offers,
                        isActive: context
                                .read<RewardsActivityAndOffersBloc>()
                                .currentScreen ==
                            RewardsActivityStateEnum.offers,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<RewardsActivityAndOffersBloc>().add(GetMyCouponRewards());
                        context.read<RewardsActivityAndOffersBloc>().add(
                              ChangeTabActivityEvent(
                                currentScreen:
                                    RewardsActivityStateEnum.myCoupon,
                              ),
                            );
                      },
                      child: RewardsFilterBox(
                        text: AppLocalizations.of(context)!.my_coupon,
                        isActive: context
                                .read<RewardsActivityAndOffersBloc>()
                                .currentScreen ==
                            RewardsActivityStateEnum.myCoupon,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 10.h),
                    if (context
                            .read<RewardsActivityAndOffersBloc>()
                            .currentScreen ==
                        RewardsActivityStateEnum.activity) ...[
                      RewardsActivityContainer(
                        rewardsActivityAndOffersBloc:
                            context.read<RewardsActivityAndOffersBloc>(),
                      ),
                    ] else if ((context
                            .read<RewardsActivityAndOffersBloc>()
                            .currentScreen ==
                        RewardsActivityStateEnum.offers)) ...[
                      RewardsActivityTicketBuyOffers(
                        rewardsActivityAndOffersBloc:
                            context.read<RewardsActivityAndOffersBloc>(),
                      ),
                    ] else ...[
                      RewardsActivityTicketMyCoupon(
                        rewardsActivityAndOffersBloc:
                            context.read<RewardsActivityAndOffersBloc>(),
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
