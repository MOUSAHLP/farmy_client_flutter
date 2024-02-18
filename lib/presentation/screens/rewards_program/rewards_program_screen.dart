import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/base_screen/base_screen.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/rewards_activity_screen.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/rewards_points_history_screen.dart';
import 'package:pharma/presentation/screens/rewards_program/rank/rewards_rank_screen.dart';
import 'package:pharma/translations.dart';

class RewardsProgramScreen extends StatelessWidget {
  const RewardsProgramScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BaseScreenScaffold(
      appbarTitle: AppLocalizations.of(context)!.rewards_Program,
      isComeBack: true,
      body: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: DefaultTabController(
                initialIndex: 1,
                length: 3,
                child: Scaffold(
                  backgroundColor: ColorManager.white,
                  appBar: AppBar(
                    backgroundColor: ColorManager.white,
                    shadowColor: ColorManager.grayForMessage,
                    toolbarHeight: 0,
                    automaticallyImplyLeading: false,
                    bottom: TabBar(
                      labelPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: ColorManager.primaryGreen,
                      unselectedLabelColor: ColorManager.grayForMessage,
                      labelColor: ColorManager.primaryGreen,
                      labelStyle: getBoldStyle(
                          color: ColorManager.grayForMessage,
                          fontSize: FontSizeApp.s14),
                      tabs: [
                        Tab(
                          child: Text(
                              AppLocalizations.of(context)!.points_and_rank),
                        ),
                        Tab(
                          child: Text(AppLocalizations.of(context)!
                              .activities_and_offers),
                        ),
                        Tab(
                          child: Text(
                              AppLocalizations.of(context)!.points_history),
                        ),
                      ],
                    ),
                  ),
                  body: const TabBarView(
                    children: [
                      RewardsRankScreen(),
                      RewardsactivityScreen(),
                      RewardsPointsHistoryScreen(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
