import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_event.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/widget/rewards_point_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_row.dart';
import 'package:pharma/core/services/services_locator.dart';

class RewardsPointsHistoryScreen extends StatelessWidget {
  const RewardsPointsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RewardsPointsBloc>(
        create: (BuildContext context) => sl<RewardsPointsBloc>(),
        child: BlocConsumer<RewardsPointsBloc, RewardsPointsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  RewardsFilterRow(rewardsFilterBoxArray: [
                    Expanded(
                        child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              context.read<RewardsPointsBloc>().add(
                                  ChangeTabPointsRewardsEvent(
                                      currentScreen:
                                          RewardsPointsStateEnum.usedPoints));
                            },
                            child: RewardsFilterBox(
                                text: "النقاط المستعملة",
                                isActive: context
                                        .read<RewardsPointsBloc>()
                                        .currentScreen ==
                                    RewardsPointsStateEnum.usedPoints))),
                    Expanded(
                        child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              context.read<RewardsPointsBloc>().add(
                                  ChangeTabPointsRewardsEvent(
                                      currentScreen:
                                          RewardsPointsStateEnum.endedpoints));
                            },
                            child: RewardsFilterBox(
                                text: "النقاط المنتهية",
                                isActive: context
                                        .read<RewardsPointsBloc>()
                                        .currentScreen ==
                                    RewardsPointsStateEnum.endedpoints))),
                    Expanded(
                        child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              context.read<RewardsPointsBloc>().add(
                                  ChangeTabPointsRewardsEvent(
                                      currentScreen:
                                          RewardsPointsStateEnum.earnedPoints));
                            },
                            child: RewardsFilterBox(
                                text: "النقاط المكتسبة",
                                isActive: context
                                        .read<RewardsPointsBloc>()
                                        .currentScreen ==
                                    RewardsPointsStateEnum.earnedPoints))),
                  ]),
                  Expanded(
                      child: ListView(
                    children: [
                      RewardsPointBox(
                          date: "1/9/2023",
                          point: "10",
                          expiredDate: "1/12/2024"),
                    ],
                  ))
                ],
              );
            }));
  }
}
