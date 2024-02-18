import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../translations.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/custom_app_bar_screen.dart';
import '../../widgets/custom_app_drawer.dart';
import '../home_screen/widgets/custom_app_bar.dart';

class BaseScreenScaffold extends StatelessWidget {
  BaseScreenScaffold(
      {required this.body,
      this.appbarTitle,
      this.onTapBack,
      this.backgroundColor,
      this.floatingActionButtonLocation,
      this.floatingActionButton,
      this.drawer,
      this.isComeBack,
      this.withNavigator = true,
      super.key});

  final Widget body;
  final Widget? drawer;
  final String? appbarTitle;
  final Function? onTapBack;
  final Color? backgroundColor;
  final bool? isComeBack;
  final bool withNavigator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (scaffoldKey.currentState?.isDrawerOpen == true) {
          scaffoldKey.currentState?.closeDrawer();
        } else {}
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButton: floatingActionButton,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appbarTitle != null ? 200.h : 150.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(scaffoldKey: scaffoldKey),
              if (appbarTitle != null)
                CustomAppBarScreen(
                    sectionName: appbarTitle!, isComeBack: isComeBack),
            ],
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: body, //children[context.read<HomeBloc>().currentIndex],
              ),
              if (withNavigator) const BottomBar(),
            ],
          ),
        ),
        drawer: const CustomAppDrawer(),
      ),
    );
  }
}
