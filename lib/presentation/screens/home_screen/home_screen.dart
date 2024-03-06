import 'package:flutter/material.dart';
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
              } else if (state.screenState == ScreenState.success) {
                context.read<LocationBloc>().state.addressCurrent =
                    state.homeData!.userAddressModel!;
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
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
                      BlocBuilder<LanguageBloc, LanguageState>(
                          builder: (context, state) {
                        return Column(
                          children: [
                            ...List.generate(
                                context
                                    .read<HomeBloc>()
                                    .homePageDynamicModel!
                                    .length, (index) {
                              List<HomePageDynamicModel> homePageDynamicModel =
                                  context
                                      .read<HomeBloc>()
                                      .homePageDynamicModel!;

                              if (homePageDynamicModel[index].type ==
                                  "category") {
                                return HomeCategory(
                                  title: homePageDynamicModel[index].title!,
                                  categoriesList: homePageDynamicModel[index]
                                      .categoryContent!,
                                );
                              } else if (homePageDynamicModel[index].type ==
                                  "section") {
                                return HomeSection(
                                  title: homePageDynamicModel[index].title!,
                                  list: homePageDynamicModel[index].sectionContent!,
                                );
                              } else if (homePageDynamicModel[index].type ==
                                  "slider") {
                                return CustomHomeCursel(
                                  verticalPadding: 10,
                                  bannerList:
                                      homePageDynamicModel[index].sliderContent,
                                  height: 164.h,
                                );
                              }
                              return const SizedBox();
                            })
                          ],
                        );
                      }),
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
