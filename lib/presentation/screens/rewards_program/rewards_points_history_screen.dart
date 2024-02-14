import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/rewards_bloc1/rewards_bloc.dart';
import 'package:pharma/bloc/rewards_bloc1/rewards_event.dart';
import 'package:pharma/bloc/rewards_bloc1/rewards_state.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/points_widget/rewards_point_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_box.dart';
import 'package:pharma/presentation/screens/rewards_program/widget/rewards_filter_row.dart';

class RewardsPointsHistoryScreen extends StatelessWidget {
  const RewardsPointsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<RewardsBloc, RewardsState>(
            listener: (context, state) {},
            builder: (context, state) {
              print("object " + state.toString());
              return RewardsFilterRow(rewardsFilterBoxArray: [
                Expanded(
                    child: InkWell(
                        onTap: () {
                          context
                              .read<RewardsBloc>()
                              .add(ChangeTabPointHistoryEvent(tabNumber: 1));
                        },
                        child: RewardsFilterBox(
                            text: "النقاط المستعملة",
                            isActive: context
                                    .read<RewardsBloc>()
                                    .pointsHistoryCurrentIndex ==
                                1))),
                Expanded(
                    child: InkWell(
                        onTap: () {
                          context
                              .read<RewardsBloc>()
                              .add(ChangeTabPointHistoryEvent(tabNumber: 1));
                        },
                        child: RewardsFilterBox(
                            text: "النقاط المنتهية",
                            isActive: context
                                    .read<RewardsBloc>()
                                    .pointsHistoryCurrentIndex ==
                                2))),
                Expanded(
                    child: InkWell(
                        onTap: () {
                          context
                              .read<RewardsBloc>()
                              .add(ChangeTabPointHistoryEvent(tabNumber: 1));
                        },
                        child: RewardsFilterBox(
                            text: "النقاط المكتسبة",
                            isActive: context
                                    .read<RewardsBloc>()
                                    .pointsHistoryCurrentIndex ==
                                3))),
              ]);
            }),
        RewardsPointBox(
            date: "1/9/2023", point: "10", expiredDate: "1/12/2024"),
      ],
    );
  }
}
