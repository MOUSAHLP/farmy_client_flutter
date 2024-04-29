import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_state.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/translations.dart';

class NextRankProgressBar extends StatelessWidget {
  const NextRankProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardsRankAndGuideBloc, RewardsRankAndGuideState>(
      builder: (context, state) {
        if (state.rewardsRankUserModel != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: PaddingApp.p30.w,
                  vertical: PaddingApp.p10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: PaddingApp.p10.w,
                      ),
                      child: SvgPicture.asset(
                        IconsManager.crown,
                        width: 30.w,
                        height: 30.h,
                        colorFilter: ColorFilter.mode(
                          Formatter.hexToColor(
                            state.rewardsRankUserModel!.data.userNextRank.color,
                          ),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: LinearProgressIndicator(
                          color: ColorManager.primaryGreen,
                          value: calculateTheValueOfProgressToTheNextLevel(
                            currentPoint:
                                state.rewardsRankUserModel!.data.userRank.limit,
                            nextPoint: state
                                .rewardsRankUserModel!.data.userNextRank.limit,
                            userPoint:
                                state.rewardsRankUserModel!.data.userPoints,
                          ),
                          minHeight: 24.h,
                          borderRadius: BorderRadius.circular(
                            13.0.r,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if(state.rewardsRankUserModel!.data.userNextRank.limit!=0)
              Text(
                "${calculateTheValueOfProgressToTheNextLevel(
                  currentPoint: state.rewardsRankUserModel!.data.userRank.limit,
                  nextPoint: state.rewardsRankUserModel!.data.userNextRank.limit,
                  userPoint: state.rewardsRankUserModel!.data.userPoints,
                ).abs()}${AppLocalizations.of(context)!.sp_remaining_to_get_the_next_level}",
                style: getRegularStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s13.sp,
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  double calculateTheValueOfProgressToTheNextLevel({
    required int currentPoint,
    required int nextPoint,
    required int userPoint,
  }) {
    return (userPoint - currentPoint) / (nextPoint - currentPoint);
  }
}
