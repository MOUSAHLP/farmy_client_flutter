import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_state.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_state.dart';
import 'package:pharma/bloc/setting_bloc/setting_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/models/home_page_dynamic_model.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_delivery_address.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_delivery_servies.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_home_cursel.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/cutsom_home_shimmer.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/home_category.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/home_section.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import 'package:pharma/presentation/widgets/dialogs/time_work_dialog.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../base_screen/base_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () => checkIsOpening(context) ? null: TimeWorkDialog().openDialog(context) ,
    ); // import 'dart:async';

    return BaseScreenScaffold(
      body: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.screenState == ScreenState.loading) {
                return const CustomHomeShimmer();
              } else if (state.screenState == ScreenState.error) {
                return Expanded(
                  child: CustomErrorScreen(
                      onTap: () {
                        sl<HomeBloc>().add(GetHomeData());
                      },
                      titleError: state.error),
                );
              } else if (state.screenState == ScreenState.success ||
                  state.screenState == ScreenState.loadMoreData) {
                context.read<LocationBloc>().state.addressCurrent = context
                    .read<HomeBloc>()
                    .homePageDynamicModel!
                    .last
                    .userAddressModel!;
                return Expanded(
                  child: Column(
                    children: [
                      sl<AuthenticationBloc>().loggedIn
                          ? BlocBuilder<LocationBloc, LocationState>(
                              builder: (context, state) {
                                return CustomDeliveryAddress(
                                  userAddressModel: state.addressCurrent,
                                );
                              },
                            )
                          : const SizedBox(),
                      if (!checkIsOpening(context))
                        const CustomDeliveryService(),
                      //// ==================== making dynamic content ==================== ////
                      Expanded(
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: context.read<HomeBloc>().scrollController,
                          shrinkWrap: true,
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: context
                                  .read<HomeBloc>()
                                  .homePageDynamicModel!
                                  .length,
                              itemBuilder: (context, index) {
                                return BlocBuilder<LanguageBloc, LanguageState>(builder: (context, languageState) {List<HomePageDynamicModel>homePageDynamicModel = context.read<HomeBloc>().homePageDynamicModel!;
                                  return Column(
                                    children: [
                                      if (homePageDynamicModel[index].type ==
                                          "category")
                                        HomeCategory(
                                          title: homePageDynamicModel[index]
                                              .title!,
                                          categoriesList:
                                              homePageDynamicModel[index]
                                                  .categoryContent!,
                                        ),
                                      if (homePageDynamicModel[index].type ==
                                          "section")
                                        HomeSection(
                                          title: homePageDynamicModel[index]
                                              .title!,
                                          sectionId:
                                              homePageDynamicModel[index].id!,
                                          list: homePageDynamicModel[index]
                                              .sectionContent!,
                                        ),
                                      if (homePageDynamicModel[index].type ==
                                          "slider")
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: CustomHomeCursel(
                                            verticalPadding: 0,
                                            bannerList:
                                                homePageDynamicModel[index]
                                                    .sliderContent,
                                            height: 164.h,
                                          ),
                                        ),
                                    ],
                                  );
                                });
                              },
                            ),

                            // loading and no data
                            context.read<HomeBloc>().buildListViewFooter(),
                          ],
                        ),
                      ),

                      // ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  bool checkIsOpening(BuildContext context) {
    DateTime dateTime = DateTime.now();
    List<String> endTime = (context.read<SettingBloc>().settingModel!.data!.openingTimes!.endTime).split(":");
    if (int.parse(endTime[0]) > dateTime.hour) {
      return true;
    } else if (int.parse(endTime[0]) == dateTime.hour) {
      if (int.parse(endTime[1]) > dateTime.minute) {
        return true;
      }
    } else {
      return false;
    }
    return false;
  }
}
