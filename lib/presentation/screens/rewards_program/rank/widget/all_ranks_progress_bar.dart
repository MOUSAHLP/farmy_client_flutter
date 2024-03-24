import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_state.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/widget/progress_bar_dot.dart';
import 'package:pharma/translations.dart';

class AllRanksProgressBar extends StatelessWidget {
  const AllRanksProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardsRankAndGuideBloc, RewardsRankAndGuideState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: LinearProgressIndicator(
                  minHeight: 2,
                  backgroundColor: ColorManager.grayForSearchProduct,
                  value: calculateTheValueOfProgressToTheAllLevel(
                    currentPoint:
                        state.rewardsRankUserModel!.data.userRank.limit,
                    nextPoint:
                        state.rewardsRankUserModel!.data.userNextRank.limit,
                    userPoint: state.rewardsRankUserModel!.data.userPoints,
                  ),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      ColorManager.primaryGreen),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: [
                ProgressBarDot(
                  text: AppLocalizations.of(context)!.bronze,
                  svg: IconsManager.crown,
                  crownColor: Formatter.hexToColor(
                    state.rewardsRankUserModel!.ranks[0].color,
                  ),
                  active: (state.rewardsRankUserModel!.data.userRank.limit >=
                          state.rewardsRankUserModel!.ranks[0].limit)
                      ? true
                      : false,
                ),
                ProgressBarDot(
                  text: AppLocalizations.of(context)!.silver,
                  svg: IconsManager.crown,
                  crownColor: Formatter.hexToColor(
                    state.rewardsRankUserModel!.ranks[1].color,
                  ),
                  active: (state.rewardsRankUserModel!.data.userRank.limit >=
                          state.rewardsRankUserModel!.ranks[1].limit)
                      ? true
                      : false,
                ),
                ProgressBarDot(
                  text: AppLocalizations.of(context)!.gold,
                  svg: IconsManager.crown,
                  crownColor: Formatter.hexToColor(
                    state.rewardsRankUserModel!.ranks[2].color,
                  ),
                  active: (state.rewardsRankUserModel!.data.userRank.limit >=
                          state.rewardsRankUserModel!.ranks[2].limit)
                      ? true
                      : false,
                ),
                ProgressBarDot(
                  text: AppLocalizations.of(context)!.platinium,
                  svg: IconsManager.crown,
                  crownColor: Formatter.hexToColor(
                    state.rewardsRankUserModel!.ranks[3].color,
                  ),
                  active: (state.rewardsRankUserModel!.data.userRank.limit >=
                          state.rewardsRankUserModel!.ranks[3].limit)
                      ? true
                      : false,
                ),

                ProgressBarDot(
                  text: AppLocalizations.of(context)!.vip,
                  svg: IconsManager.crown,
                  crownColor: Formatter.hexToColor(
                    state.rewardsRankUserModel!.ranks[4].color,
                  ),
                  active: (state.rewardsRankUserModel!.data.userRank.limit >=
                          state.rewardsRankUserModel!.ranks[4].limit)
                      ? true
                      : false,
                ),
                ProgressBarDot(
                  text: AppLocalizations.of(context)!.vip_plus,
                  svg: IconsManager.crown,
                  crownColor: Formatter.hexToColor(
                    state.rewardsRankUserModel!.ranks[5].color,
                  ),
                  active: (state.rewardsRankUserModel!.data.userRank.limit >=
                          state.rewardsRankUserModel!.ranks[5].limit)
                      ? true
                      : false,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  double calculateTheValueOfProgressToTheAllLevel({
    required int currentPoint,
    required int nextPoint,
    required int userPoint,
  }) {
    double tmp = ((userPoint - currentPoint) / (nextPoint - currentPoint)) * 0.2;
    print('tmp: $tmp');

    switch (nextPoint) {
      case 100:
        tmp = tmp + 0.0;
        break;
      case 300:
        tmp = tmp + 0.2;
        break;
      case 500:
        tmp = tmp + 0.4;
        break;
      case 800:
        tmp = tmp + 0.6;
        break;
      case 1500:
        tmp = tmp + 0.8;
        break;
    }
    print('========================');
    print(tmp);
    print('========================');
    return tmp;
  }
}
