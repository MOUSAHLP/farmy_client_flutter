import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_event.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/widget/rewards_point_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_row.dart';
import 'package:pharma/translations.dart';

class RewardsPointsHistoryScreen extends StatelessWidget {
  RewardsPointsHistoryScreen({super.key});

  final rewardsPointsHistoryBloc = RewardsPointsHistoryBloc();

  @override
  Widget build(BuildContext context) {
    rewardsPointsHistoryBloc.add(GetRewardsPointsHistoryValid());
    return BlocConsumer<RewardsPointsHistoryBloc, RewardsPointsHistoryState>(
      listener: (context, state) {
        if (state is RewardsTabPointsHistoryChanged) {}
      },
      builder: (context, state) {
        if (state is RewardsPointsInit) {
          context.read<RewardsPointsHistoryBloc>().add(
                ChangeTabPointsRewardsEvent(
                  currentScreen: RewardsPointsStateEnum.earnedPoints,
                ),
              );
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            RewardsFilterRow(
              rewardsFilterBoxArray: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      rewardsPointsHistoryBloc
                          .add(GetRewardsPointsHistoryValid());
                      context.read<RewardsPointsHistoryBloc>().add(
                            ChangeTabPointsRewardsEvent(
                              currentScreen:
                                  RewardsPointsStateEnum.earnedPoints,
                            ),
                          );
                    },
                    child: RewardsFilterBox(
                      text: AppLocalizations.of(context)!.earned_points,
                      isActive: context
                              .read<RewardsPointsHistoryBloc>()
                              .currentScreen ==
                          RewardsPointsStateEnum.earnedPoints,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      rewardsPointsHistoryBloc
                          .add(GetRewardsPointsHistoryUsed());
                      context.read<RewardsPointsHistoryBloc>().add(
                            ChangeTabPointsRewardsEvent(
                              currentScreen: RewardsPointsStateEnum.usedPoints,
                            ),
                          );
                    },
                    child: RewardsFilterBox(
                      text: AppLocalizations.of(context)!.used_points,
                      isActive: context
                              .read<RewardsPointsHistoryBloc>()
                              .currentScreen ==
                          RewardsPointsStateEnum.usedPoints,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      rewardsPointsHistoryBloc
                          .add(GetRewardsPointsHistoryExpired());
                      context.read<RewardsPointsHistoryBloc>().add(
                            ChangeTabPointsRewardsEvent(
                              currentScreen: RewardsPointsStateEnum.endedPoints,
                            ),
                          );
                    },
                    child: RewardsFilterBox(
                      text: AppLocalizations.of(context)!.ended_points,
                      isActive: context
                              .read<RewardsPointsHistoryBloc>()
                              .currentScreen ==
                          RewardsPointsStateEnum.endedPoints,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 10.h),
                  if (context.read<RewardsPointsHistoryBloc>().currentScreen ==
                      RewardsPointsStateEnum.earnedPoints) ...[
                    RewardsPointHistoryBox(
                      expired: true,
                      rewardsPointsHistoryBloc: rewardsPointsHistoryBloc,
                    ),
                  ] else if (context
                          .read<RewardsPointsHistoryBloc>()
                          .currentScreen ==
                      RewardsPointsStateEnum.endedPoints) ...[
                    RewardsPointHistoryBox(
                      expired: true,
                      rewardsPointsHistoryBloc: rewardsPointsHistoryBloc,
                    )
                  ] else ...[
                    RewardsPointHistoryBox(
                      expired: true,
                      rewardsPointsHistoryBloc: rewardsPointsHistoryBloc,
                    )
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
