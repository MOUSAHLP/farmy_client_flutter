import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_event.dart';
import 'package:pharma/bloc/rewards_bloc/guide_bloc/rewards_guide_state.dart';
import 'package:pharma/core/utils/formatter.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_guide/widget/membership_level_explain.dart';
import 'package:pharma/presentation/widgets/dialogs/loading_dialog.dart';

class MembershipLevelsWidget extends StatelessWidget {
  final RewardsGuideBloc _rewardsGuideBloc = RewardsGuideBloc();

  MembershipLevelsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    _rewardsGuideBloc.add(GetRewardsMemberShipGuide());
    return BlocConsumer<RewardsGuideBloc, RewardsGuideState>(
      bloc: _rewardsGuideBloc,
      builder: (context, state) {
        if (state.isSuccessMemberShip) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingApp.p20,
              vertical: PaddingApp.p10,
            ),
            child: ListView(
              children: [
                HtmlWidget(
                  _rewardsGuideBloc.rewardMembershipGuideModel!.data.html,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return MembershipLevelExplain(
                      level: _rewardsGuideBloc
                          .rewardMembershipGuideModel!.data.ranks[index].name,
                      explain: _rewardsGuideBloc.rewardMembershipGuideModel!
                          .data.ranks[index].description,
                      features: const [1, 1],
                      crownColor: Formatter.hexToColor(_rewardsGuideBloc
                          .rewardMembershipGuideModel!.data.ranks[index].color),
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
                  itemCount: _rewardsGuideBloc
                      .rewardMembershipGuideModel!.data.ranks.length,
                ),
                SizedBox(
                  height: 15.h,
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
      listener: (context, state) {
        if (state.isLoadingMemberShip) {
          LoadingDialog().openDialog(context);
        }
        if (state.isSuccessMemberShip) {
          LoadingDialog().closeDialog(context);
        }
      },
    );
  }
}
