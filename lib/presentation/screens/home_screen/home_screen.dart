import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_bloc.dart';
import 'package:pharma/bloc/language_bloc/language_state.dart';
import 'package:pharma/bloc/location_bloc/location_bloc.dart';
import 'package:pharma/bloc/location_bloc/location_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/models/home_page_dynamic_model.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_delivery_address.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_delivery_servies.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_home_cursel.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/cutsom_home_shimmer.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/home_category.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/home_section.dart';
import 'package:pharma/presentation/widgets/custom_error_screen.dart';
import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../base_screen/base_screen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseScreenScaffold(
      // key: widget.scaffoldKey,
      // drawer: const CustomAppDrawer(),
      body: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              RefreshController refreshController =
                  context.read<HomeBloc>().refreshController;
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
                // context.read<LocationBloc>().state.addressCurrent =
                //     state.homeData!.userAddressModel!;
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
                      const CustomDeliveryService(),

                      //// sections
                      // state.homeData!.homeCategoriesList!.isNotEmpty
                      //     ? HomeCategory(
                      //         categoriesList:
                      //             state.homeData!.homeCategoriesList!,
                      //       )
                      //     : const SizedBox(),
                      // if (state.homeData!.homeBannerListTopSection!.isNotEmpty)
                      //   CustomHomeCursel(
                      //     verticalPadding: state.homeData!
                      //             .homeSuggestedProductsList!.isNotEmpty
                      //         ? 0
                      //         : 0,
                      //     bannerList: state.homeData!.homeBannerListTopSection,
                      //     height: 164.h,
                      //   ),
                      // if (state.homeData!.homeSuggestedProductsList!.isNotEmpty)
                      //   HomeSection(
                      //       list: state.homeData!.homeSuggestedProductsList!),
                      // if (state
                      //     .homeData!.homeBannerListBottomSection!.isNotEmpty)
                      //   CustomHomeCursel(
                      //     verticalPadding: state.homeData!
                      //             .homeSuggestedProductsList!.isNotEmpty
                      //         ? 0
                      //         : 10,
                      //     bannerList:
                      //         state.homeData!.homeBannerListBottomSection,
                      //     height: 164.h,
                      //   ),
                      // if (state
                      //     .homeData!.homeDiscountedProductsList!.isNotEmpty)
                      //   HomeSection(
                      //       list: state.homeData!.homeDiscountedProductsList!),

                      //// ==================== making dynamic content ==================== ////
                      Expanded(
                        child: SmartRefresher(
                          controller: refreshController,
                          enablePullDown: true,
                          enablePullUp: true,
                          onRefresh: () => sl<HomeBloc>().add(GetHomeData()),
                          onLoading: () =>
                              sl<HomeBloc>().add(OnLoadingHomeData()),
                          footer: CustomFooter(
                            builder: (BuildContext context, LoadStatus? mode) {
                              Widget body;
                              if (mode == LoadStatus.loading) {
                                body = const CircularProgressIndicator();
                              } else if (mode == LoadStatus.failed) {
                                body = const Text("Load Failed!Click retry!");
                              } else if (mode == LoadStatus.canLoading) {
                                body = const Text("release to load more");
                              } else {
                                body = const Text("No More Data");
                              }
                              return SizedBox(
                                height: 55.0,
                                child: Center(child: body),
                              );
                            },
                          ),
                          child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: context
                                .read<HomeBloc>()
                                .homePageDynamicModel!
                                .length,
                            itemBuilder: (context, index) {
                              return BlocBuilder<LanguageBloc, LanguageState>(
                                  builder: (context, state) {
                                List<HomePageDynamicModel>
                                    homePageDynamicModel = context
                                        .read<HomeBloc>()
                                        .homePageDynamicModel!;

                                return Column(
                                  children: [
                                    if (homePageDynamicModel[index].type ==
                                        "category")
                                      HomeCategory(
                                        title:
                                            homePageDynamicModel[index].title!,
                                        categoriesList:
                                            homePageDynamicModel[index]
                                                .categoryContent!,
                                      ),
                                    if (homePageDynamicModel[index].type ==
                                        "section")
                                      HomeSection(
                                        title:
                                            homePageDynamicModel[index].title!,
                                        list: homePageDynamicModel[index]
                                            .sectionContent!,
                                      ),
                                    if (homePageDynamicModel[index].type ==
                                        "slider")
                                      CustomHomeCursel(
                                        verticalPadding: 10,
                                        bannerList: homePageDynamicModel[index]
                                            .sliderContent,
                                        height: 164.h,
                                      ),
                                  ],
                                );
                              });
                            },
                          ),
                        ),
                      ),
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
}
