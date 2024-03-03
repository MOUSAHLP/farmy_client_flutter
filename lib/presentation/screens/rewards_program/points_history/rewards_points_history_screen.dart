import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_event.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/widget/rewards_point_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_row.dart';
import 'package:pharma/translations.dart';

class RewardsPointsHistoryScreen extends StatelessWidget {
  const RewardsPointsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RewardsPointsBloc, RewardsPointsState>(
        listener: (context, state) {
      if (state is RewardsTabPointsHistoryChanged) {
      }
    }, builder: (context, state) {
      if (state is RewardsPointsInit) {
        context.read<RewardsPointsBloc>().add(ChangeTabPointsRewardsEvent(
            currentScreen: RewardsPointsStateEnum.earnedPoints));
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        children: [
          RewardsFilterRow(rewardsFilterBoxArray: [
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      context.read<RewardsPointsBloc>().add(
                          ChangeTabPointsRewardsEvent(
                              currentScreen:
                                  RewardsPointsStateEnum.earnedPoints));
                    },
                    child: RewardsFilterBox(
                        text: AppLocalizations.of(context)!.earned_points,
                        isActive:
                            context.read<RewardsPointsBloc>().currentScreen ==
                                RewardsPointsStateEnum.earnedPoints))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      context.read<RewardsPointsBloc>().add(
                          ChangeTabPointsRewardsEvent(
                              currentScreen:
                                  RewardsPointsStateEnum.usedPoints));
                    },
                    child: RewardsFilterBox(
                        text: AppLocalizations.of(context)!.used_points,
                        isActive:
                            context.read<RewardsPointsBloc>().currentScreen ==
                                RewardsPointsStateEnum.usedPoints))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      context.read<RewardsPointsBloc>().add(
                          ChangeTabPointsRewardsEvent(
                              currentScreen:
                                  RewardsPointsStateEnum.endedpoints));
                    },
                    child: RewardsFilterBox(
                        text: AppLocalizations.of(context)!.ended_points,
                        isActive:
                            context.read<RewardsPointsBloc>().currentScreen ==
                                RewardsPointsStateEnum.endedpoints))),
          ]),
          Expanded(
              child: ListView(
            children: const [
              RewardsPointBox(
                  date: "1/9/2023", point: "10", expiredDate: "1/12/2024"),
              RewardsPointBox(
                date: "1/9/2023",
                point: "100",
              ),
            ],
          ))
        ],
      );
    });
  }
}
