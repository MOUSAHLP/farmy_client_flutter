import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_event.dart';
import 'package:pharma/bloc/rewards_bloc/points_bloc/rewards_points_state.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/widget/rewards_point_point.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/widget/rewards_point_row.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:pharma/translations.dart';

class RewardsPointHistoryBox extends StatelessWidget {
  final bool expired;
  final RewardsPointsHistoryBloc rewardsPointsHistoryBloc;

  const RewardsPointHistoryBox({
    super.key,
    required this.rewardsPointsHistoryBloc,
    required this.expired,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RewardsPointsHistoryBloc, RewardsPointsHistoryState>(
      bloc: rewardsPointsHistoryBloc,
      listener: (context, state) {
        if (state.isLoading) {
          LoadingDialog().openDialog(context);
        }
        if (state.isSuccess) {
          LoadingDialog().closeDialog(context);
        }
      },
      builder: (context, state) {
        if (rewardsPointsHistoryBloc.rewardHistoryModel != null) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
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
                      color:  ColorManager.primaryGreen ,
                      point: rewardsPointsHistoryBloc.rewardHistoryModel!.data[index].points,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: PaddingApp.p8,
                        ),
                        child: Column(
                          children: [
                            RewardsPointRow(
                              text: AppLocalizations.of(context)!.date_of_use,
                              date: Formatter.formatDate(
                                rewardsPointsHistoryBloc
                                    .rewardHistoryModel!.data[index].createdAt,
                              ),
                            ),
                            if (expired)
                              RewardsPointRow(
                                text: AppLocalizations.of(context)!.expiry_date,
                                date: Formatter.formatDate(
                                  rewardsPointsHistoryBloc
                                      .rewardHistoryModel!.data[index].createdAt,
                                ),
                                expired: true,
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
              itemCount: rewardsPointsHistoryBloc.rewardHistoryModel!.data.length,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
