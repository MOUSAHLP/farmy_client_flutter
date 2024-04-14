import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/rewards_bloc/activity_and_offers_bloc/rewards_activity_offers_bloc.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_progress_container.dart';
import 'package:pharma/translations.dart';

class RewardsActivityContainer extends StatelessWidget {
  final RewardsActivityAndOffersBloc rewardsActivityAndOffersBloc;

  const RewardsActivityContainer({
    super.key,
    required this.rewardsActivityAndOffersBloc,
  });

  @override
  Widget build(BuildContext context) {
    if (rewardsActivityAndOffersBloc.state.rewardsActivityAndOffersSuccess) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(
            vertical: PaddingApp.p10.h,
          ),
          padding: const EdgeInsets.all(
            PaddingApp.p10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              RadiusApp.r8.r,
            ),
            color: Colors.white,
            boxShadow: [
              ColorManager.shadowGaryDown,
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rewardsActivityAndOffersBloc.state.rewardCouponsActivityModel!
                    .data[index].achievement,
                style: getUnderBoldStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s14.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                AppLocalizations.of(context)!.prize,
                style: getBoldStyle(
                  color: ColorManager.primaryGreen,
                  fontSize: FontSizeApp.s14.sp,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                rewardsActivityAndOffersBloc.state.rewardCouponsActivityModel!
                    .data[index].description,
                style: getRegularStyle(
                    color: ColorManager.grayForMessage,
                    fontSize: FontSizeApp.s14),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0;
                      i <
                          rewardsActivityAndOffersBloc
                              .state
                              .rewardCouponsActivityModel!
                              .data[index]
                              .segments;
                      i++) ...[
                    RewardsProgressContainer(
                      active: rewardsActivityAndOffersBloc
                                  .state
                                  .rewardCouponsActivityModel!
                                  .data[index]
                                  .achievementsDoneCount >
                              i
                          ? true
                          : false,
                    ),
                  ]
                ],
              )
            ],
          ),
        ),
        itemCount: rewardsActivityAndOffersBloc.state.rewardCouponsActivityModel!.data.length,
      );
    }
    return const Center(
        child: CircularProgressIndicator(
      color: ColorManager.primaryGreen,
    ));
  }
}
