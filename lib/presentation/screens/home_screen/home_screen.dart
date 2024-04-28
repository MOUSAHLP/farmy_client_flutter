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
import '../../../bloc/basket_bloc/basket_bloc.dart';
import '../../resources/color_manager.dart';
import 'package:pharma/translations.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/core/app_router/app_router.dart';
import '../basket_screen/basket_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {


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
              } else if (state.screenState == ScreenState.success || state.screenState == ScreenState.loadMoreData) {
                context.read<LocationBloc>().state.addressCurrent = context
                    .read<HomeBloc>()
                    .homePageDynamicModel!
                    .last
                    .userAddressModel!;
                Future.delayed(
                  Duration.zero,
                      () => checkIsOpening(context) ? null: TimeWorkDialog().openDialog(context) ,
                );
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
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ListView(
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
                            context
                                .read<BasketBloc>()
                                .mutableProducts
                                .isNotEmpty
                                ? Padding(
                              padding:
                              const EdgeInsets.all(20.0),
                              child: InkWell(
                                child: Container(
                                  height: 40,
                                  width: 1.sw - 100,
                                  decoration: BoxDecoration(
                                      color: ColorManager
                                          .primaryGreen,
                                      borderRadius:
                                      BorderRadius
                                          .circular(6)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                      children: [
                                        Text(
                                            context
                                                .read<
                                                BasketBloc>()
                                                .mutableProducts
                                                .length
                                                .toString(),
                                            style: getBoldStyle(
                                                color: Colors
                                                    .white)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            AppLocalizations.of(
                                                context)!
                                                .view_basket,
                                            style: getBoldStyle(
                                                color: Colors
                                                    .white)),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  context.read<HomeBloc>().currentIndex = 2;
                                  AppRouter.push(context,
                                      const BasketScreen());
                                },
                              ),
                            )
                                : const SizedBox()
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
    print("======================================================================");
    print(dateTime.hour);
    print("======================================================================");
    print(endTime[0]);
    print("======================================================================");
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
