import 'package:flutter/material.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_bloc.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/widget/rewards_point_point.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/widget/rewards_point_row.dart';
import 'package:pharma/translations.dart';

class RewardsPointHistoryBox extends StatelessWidget {
  final RewardsPointsHistoryBloc rewardsPointsHistoryBloc;
  final Color colorPoints;
   final bool? isOffers;

  const RewardsPointHistoryBox({
    super.key,
    required this.rewardsPointsHistoryBloc,
    required this.colorPoints,
    this.isOffers,
  });

  @override
  Widget build(BuildContext context) {
    if (rewardsPointsHistoryBloc.state.rewardsPointsHistorySuccess) {
      if(!rewardsPointsHistoryBloc.state.rewardsUsedPoints) {
        return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(
            horizontal: PaddingApp.p16,
            vertical: PaddingApp.p8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusApp.r5),
            color: Colors.white,
            boxShadow: [
              ColorManager.shadowGaryDown,
            ],
          ),
          child: Row(
            children: [
              RewardsPointPoint(
                color: colorPoints,
                point: rewardsPointsHistoryBloc
                    .state.rewardHistoryModel!.data[index].points,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: PaddingApp.p8,
                  ),
                  child: Column(
                    children: [
                      if (rewardsPointsHistoryBloc.state.rewardHistoryModel!.data[index].expired) ...[
                        RewardsPointRow(
                          expired: false,
                          text: AppLocalizations.of(context)!.date_of_earn,
                          date: Formatter.formatDate(
                            rewardsPointsHistoryBloc.state.rewardHistoryModel!
                                .data[index].createdAt,
                          ),
                        ),
                        RewardsPointRow(
                          text: AppLocalizations.of(context)!.expiry_date,
                          date: Formatter.formatDate(
                            rewardsPointsHistoryBloc.state.rewardHistoryModel!
                                .data[index].createdAt,
                          ),
                          expired: rewardsPointsHistoryBloc
                              .state.rewardHistoryModel!.data[index].expired,
                        ),
                      ] else ...[
                        RewardsPointRow(
                          expired: rewardsPointsHistoryBloc
                              .state.rewardHistoryModel!.data[index].expired,
                          text: AppLocalizations.of(context)!.date_of_use,
                          date: Formatter.formatDate(
                            rewardsPointsHistoryBloc.state.rewardHistoryModel!
                                .data[index].createdAt,
                          ),
                        ),
                        RewardsPointRow(
                          expired: false,
                          text: AppLocalizations.of(context)!.date_of_earn,
                          date: Formatter.formatDate(
                            rewardsPointsHistoryBloc.state.rewardHistoryModel!
                                .data[index].createdAt,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount:
            rewardsPointsHistoryBloc.state.rewardHistoryModel!.data.length,
      );
      }
      if(rewardsPointsHistoryBloc.state.rewardsUsedPoints) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(
              horizontal: PaddingApp.p16,
              vertical: PaddingApp.p8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusApp.r5),
              color: Colors.white,
              boxShadow: [
                ColorManager.shadowGaryDown,
              ],
            ),
            child: Row(
              children: [
                RewardsPointPoint(
                  color: colorPoints,
                  point: rewardsPointsHistoryBloc.state.rewardsUsedPointsModel!.data[index].points,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PaddingApp.p8,
                    ),
                    child: Column(
                      children: [
                          RewardsPointRow(
                            expired: false,
                            text: AppLocalizations.of(context)!.date_of_use,
                            date: Formatter.formatDate(rewardsPointsHistoryBloc.state.rewardsUsedPointsModel!.data[index].user.createdAt,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount:
          rewardsPointsHistoryBloc.state.rewardsUsedPointsModel!.data.length,
        );
      }
    }


    return const Center(
      child: CircularProgressIndicator(
        color: ColorManager.primaryGreen,
      ),
    );
  }
}
