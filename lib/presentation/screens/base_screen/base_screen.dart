import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/screens/home_screen/home_screen.dart';

import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../core/app_router/app_router.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/custom_app_bar_screen.dart';
import '../../widgets/custom_app_drawer.dart';
import '../../widgets/dialogs/will_pop_scope_handler.dart';
import '../home_screen/widgets/custom_app_bar.dart';

class BaseScreenScaffold extends StatelessWidget {
  BaseScreenScaffold({
    required this.body,
    this.appbarTitle,
    this.onTapBack,
    this.backgroundColor,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.drawer,
    this.isComeBack,
    this.withNavigator = true,
    super.key,
  });

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
        } else {
            WillPopScopeHandler.handle(context);
        }
        return false;
      },
      child: Scaffold(
        key:scaffoldKey,
        backgroundColor: backgroundColor,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButton: floatingActionButton,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appbarTitle != null ? 195.h : 140.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(scaffoldKey: scaffoldKey),
              if (appbarTitle != null)
                CustomAppBarScreen(
                  sectionName: appbarTitle!,
                  isComeBack: isComeBack,
                ),
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
