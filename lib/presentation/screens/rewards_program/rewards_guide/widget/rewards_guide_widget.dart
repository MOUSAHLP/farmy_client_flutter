import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_bloc.dart';
import 'package:pharma/bloc/rewards_bloc/rank_bloc/rewards_rank_state.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class RewardsGuideWidget extends StatelessWidget {
  final RewardsRankAndGuideBloc rewardsRankAndGuideBloc;

  const RewardsGuideWidget({super.key, required this.rewardsRankAndGuideBloc});

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<RewardsRankAndGuideBloc, RewardsRankAndGuideState>(
        bloc: rewardsRankAndGuideBloc,
      builder: (context, state) {
        if (rewardsRankAndGuideBloc.state.rewardGuideModel!=null) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingApp.p20,
                  vertical: PaddingApp.p10,
                ),
                child:
                    HtmlWidget(rewardsRankAndGuideBloc.state.rewardGuideModel!.data.html),
              )
            ],
          );
        }
        return const Center(child: CircularProgressIndicator(color: ColorManager.primaryGreen,));
      },
    );
  }
}
