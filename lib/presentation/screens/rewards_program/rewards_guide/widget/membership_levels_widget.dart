import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_event.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_state.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_state.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/widget/membership_level_explain.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';

class MembershipLevelsWidget extends StatelessWidget {
  final RewardsRankAndGuideBloc rewardsRankAndGuideBloc;

    const MembershipLevelsWidget({super.key, required this.rewardsRankAndGuideBloc});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardsRankAndGuideBloc, RewardsRankAndGuideState>(
      bloc: rewardsRankAndGuideBloc,
      builder: (context, state) {
        if (rewardsRankAndGuideBloc.state.rewardMembershipGuideModel!=null)  {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingApp.p20,
              vertical: PaddingApp.p10,
            ),
            child: ListView(
              children: [
                HtmlWidget(
                  rewardsRankAndGuideBloc.state.rewardMembershipGuideModel!.data.html,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return MembershipLevelExplain(
                      level: rewardsRankAndGuideBloc.state.rewardMembershipGuideModel!.data.ranks[index].name,
                      explain: rewardsRankAndGuideBloc.state.rewardMembershipGuideModel!.data.ranks[index].description,
                      features: rewardsRankAndGuideBloc.state.rewardMembershipGuideModel!.data.ranks[index].features  ,
                      crownColor: Formatter.hexToColor(rewardsRankAndGuideBloc.state.rewardMembershipGuideModel!.data.ranks[index].color),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.lightGray,
                        ),
                      ),
                    );
                  },
                  itemCount: rewardsRankAndGuideBloc.state
                      .rewardMembershipGuideModel!.data.ranks.length,
                ),
                SizedBox(
                  height: 15.h,
                )
              ],
            ),
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
