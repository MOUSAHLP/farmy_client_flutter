import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_event.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_state.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/widget/all_ranks_progress_bar.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/widget/next_rank_progress_bar.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/widget/points_expire_in_widget.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/widget/your_points_box.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/widget/your_rank.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/rewards_guide_screen.dart';
import 'package:pharma/translations.dart';

class RewardsRankScreen extends StatelessWidget {
  const RewardsRankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardsRankAndGuideBloc, RewardsRankAndGuideState>(
      builder: (context, state) {
        if (state.rewardsRankUserModel != null) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const YourRank(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const AllRanksProgressBar(),
                    SizedBox(
                      height: 10.h,
                    ),
                    const NextRankProgressBar(),
                    SizedBox(
                      height: 25.h,
                    ),
                    const YourPointsBox(),
                    SizedBox(
                      height: 25.h,
                    ),
                    PointsExpireInWidget(
                        expireInText:
                            "90 ${AppLocalizations.of(context)!.day}"),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<RewardsRankAndGuideBloc>()
                            .add(GetRewardsGuide());
                        context
                            .read<RewardsRankAndGuideBloc>()
                            .add(GetRewardsMemberShipGuide());
                        AppRouter.push(
                          context,
                          RewardsGuideScreen(
                            rewardsRankAndGuideBloc:
                                context.read<RewardsRankAndGuideBloc>(),
                          ),
                          routeTransition: RouteTransitions.fade,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: PaddingApp.p30,
                            vertical: PaddingApp.p18),
                        padding: const EdgeInsets.all(PaddingApp.p10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(RadiusApp.r12),
                          border: Border.all(
                            color: ColorManager.primaryGreen,
                            width: 2,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.rewards_guide,
                            style: getBoldStyle(
                              color: ColorManager.primaryGreen,
                              fontSize: FontSizeApp.s14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: ColorManager.primaryGreen,
          ),
        );
      },
    );
  }
}
