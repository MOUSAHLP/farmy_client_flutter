import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/rewards_bloc1/rewards_bloc.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_app_bar.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_activity_screen.dart';
import 'package:pharma/presentation/screens/rewards_program/rewards_points_history_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';

class RewardsProgramScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const RewardsProgramScreen({
    super.key,
    required this.scaffoldKey,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RewardsBloc>(
      create: (BuildContext context) => sl<RewardsBloc>(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              CustomAppBar(scaffoldKey: scaffoldKey),
              const CustomAppBarScreen(
                  sectionName: "برنامج المكافئات \"مرحبا\""),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    backgroundColor: ColorManager.white,
                    appBar: AppBar(
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
                        tabs: const [
                          Tab(
                            child: Text("النقاط و الرتبة"),
                          ),
                          Tab(
                            child: Text("الأنشطة و العروض"),
                          ),
                          Tab(
                            child: Text("تاريخ النقاط"),
                          ),
                        ],
                      ),
                    ),
                    body: const TabBarView(
                      children: [
                        Icon(Icons.directions_transit),
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
      ),
    );
  }
}
