import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_app_bar.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_delivery_address.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_delivery_servies.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_home_cursel.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_section_name.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/cutsom_home_shimmer.dart';
import 'package:pharma/presentation/screens/location_screen/location_screen.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/presentation/widgets/custom_app_drawer.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../all_section/all_section_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (scaffoldKey.currentState?.isDrawerOpen == true) {
          scaffoldKey.currentState?.closeDrawer();
        } else {}
        return true;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          log(state.toString());
          return Scaffold(
            key: scaffoldKey,
            drawer: const CustomAppDrawer(),
            body: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Column(
                children: [
                  CustomAppBar(scaffoldKey: scaffoldKey),
                  state.screenState == ScreenState.loading
                      ? const CustomHomeShimmer()
                      : state.screenState == ScreenState.success
                          ? Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  sl<AuthenticationBloc>().loggedIn?const CustomDeliveryAddress():const SizedBox(),
                                  const CustomDeliveryService(),
                                  state.homeData!.homeCategoriesList!.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 33, vertical: 13),
                                          child: CustomSectionName(
                                            sectionName:
                                                AppLocalizations.of(context)!
                                                    .sections,
                                            onTap: () {
                                              AppRouter.push(context,
                                                  const ALlSectionScreen());
                                            },
                                          ),
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeCategoriesList!.isNotEmpty
                                      ? SizedBox(
                                          height: 305,
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 19),
                                            itemCount: state.homeData!
                                                .homeCategoriesList!.length,
                                            scrollDirection: Axis.horizontal,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisSpacing: 23,
                                                    mainAxisSpacing: 20,
                                                    mainAxisExtent: 97,
                                                    crossAxisCount: 2),
                                            itemBuilder: (context, index) {
                                              return CustomCategory(
                                                categoryImage: state
                                                    .homeData!
                                                    .homeCategoriesList![index]
                                                    .imageUrl,
                                                categoryName: state
                                                            .homeData!
                                                            .homeCategoriesList![
                                                                index]
                                                            .name !=
                                                        null
                                                    ? state
                                                        .homeData!
                                                        .homeCategoriesList![
                                                            index]
                                                        .name!
                                                    : "",
                                              );
                                            },
                                          ),
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeBannerListTopSection!
                                          .isNotEmpty
                                      ? CustomHomeCursel(
                                          bannerList: state.homeData!
                                              .homeBannerListTopSection,
                                          height: 0.5.sw,
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeSuggestedProductsList!
                                          .isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 33, vertical: 13),
                                          child: CustomSectionName(
                                            sectionName:
                                                AppLocalizations.of(context)!
                                                    .suggested_products,
                                            onTap: () {},
                                          ),
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeSuggestedProductsList!
                                          .isNotEmpty
                                      ? SizedBox(
                                          height: 238,
                                          width: 1.sw,
                                          child: ListView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            itemCount: state
                                                .homeData!
                                                .homeSuggestedProductsList!
                                                .length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                  padding:
                                                      EdgeInsetsDirectional.only(
                                                          bottom: 10,
                                                          start: index == 0
                                                              ? 0
                                                              : 15),
                                                  child: CustomProductCard(
                                                      isSellerFound: state
                                                                  .homeData!
                                                                  .homeSuggestedProductsList![
                                                                      index]
                                                                  .sellerName !=
                                                              null
                                                          ? true
                                                          : false,
                                                      isDisCount: state
                                                                  .homeData!
                                                                  .homeSuggestedProductsList![
                                                                      index]
                                                                  .discountStatus ==
                                                              "1"
                                                          ? true
                                                          : false,
                                                      productInfo: state
                                                          .homeData!
                                                          .homeSuggestedProductsList![index]));
                                            },
                                          ),
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeBannerListBottomSection!
                                          .isNotEmpty
                                      ? CustomHomeCursel(
                                          bannerList: state.homeData!
                                              .homeBannerListBottomSection,
                                          height: 0.5.sw,
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeDiscountedProductsList!
                                          .isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 33, vertical: 13),
                                          child: CustomSectionName(
                                            sectionName:
                                                AppLocalizations.of(context)!
                                                    .discounts,
                                            onTap: () {},
                                          ),
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeDiscountedProductsList!
                                          .isNotEmpty
                                      ? SizedBox(
                                          height: 238,
                                          width: 1.sw,
                                          child: ListView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            itemCount: state
                                                .homeData!
                                                .homeDiscountedProductsList!
                                                .length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        bottom: 10,
                                                        start: index == 0
                                                            ? 0
                                                            : 15),
                                                child: CustomProductCard(
                                                    isSellerFound: state
                                                                .homeData!
                                                                .homeDiscountedProductsList![
                                                                    index]
                                                                .sellerName !=
                                                            null
                                                        ? true
                                                        : false,
                                                    isDisCount: state
                                                                .homeData!
                                                                .homeDiscountedProductsList![
                                                                    index]
                                                                .discountStatus ==
                                                            "1"
                                                        ? true
                                                        : false,
                                                    productInfo: state.homeData!
                                                            .homeDiscountedProductsList![
                                                        index]),
                                              );
                                            },
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            )
                          : state.screenState == ScreenState.error
                              ?
                              // todo error try again
                              const Text("try again")
                              : const SizedBox()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
