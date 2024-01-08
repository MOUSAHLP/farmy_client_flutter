import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_app_bar.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_home_cursel.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/custom_section_name.dart';
import 'package:pharma/presentation/screens/home_screen/widgets/cutsom_home_shimmer.dart';
import 'package:pharma/presentation/screens/location_screen/location_screen.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/presentation/widgets/custom_app_drawer.dart';
import 'package:pharma/translations.dart';

import '../all_section/all_section_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.scaffoldKey.currentState?.isDrawerOpen == true) {
          widget.scaffoldKey.currentState?.closeDrawer();
        } else {}
        return true;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            key: widget.scaffoldKey,
            drawer: const CustomAppDrawer(),
            body: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Column(
                children: [
                  CustomAppBar(scaffoldKey: widget.scaffoldKey),
                  state.screenState == ScreenState.loading
                      ? const CustomHomeShimmer()
                      : state.screenState == ScreenState.success
                          ? Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 13),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: const Border(
                                            left: BorderSide(
                                                color: ColorManager
                                                    .grayForMessage),
                                            right: BorderSide(
                                                color: ColorManager
                                                    .grayForMessage),
                                            top: BorderSide(
                                                color: ColorManager
                                                    .grayForMessage), // White border at the top
                                            bottom: BorderSide(
                                                color: ColorManager
                                                    .grayForMessage), // White border at the bottom
                                          )),
                                      width: 1.sw,
                                      height: 61,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 21),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              ImageManager.location,
                                              height: 30,
                                              width: 30,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .delivery_to,
                                                        style: getSemiBoldStyle(
                                                                color: ColorManager
                                                                    .grayForMessage,
                                                                fontSize:
                                                                    FontSizeApp
                                                                        .s10)!
                                                            .copyWith(
                                                                height: 1),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "دمشق - الميدان - بناء الادخار ",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: getBoldStyle(
                                                                  fontSize:
                                                                      FontSizeApp
                                                                          .s13,
                                                                  color: ColorManager
                                                                      .primaryGreen)!
                                                              .copyWith(
                                                                  height: 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                AppRouter.push(context,
                                                    const LocationScreen());
                                              },
                                              child: const Icon(
                                                Icons.arrow_forward_ios,
                                                size: 20,
                                                color:
                                                    ColorManager.grayForMessage,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13),
                                    // padding: const EdgeInsets.symmetric(horizontal: 21),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 1.sw,
                                        height: 61,
                                        color: ColorManager.lightGray,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 22, vertical: 6),
                                          child: Text(
                                            "خدمة التوصيل متوفرة من الساعة 9 صباحاً حتى الساعة 10 مساءً, من الممكن اختيار الطلب الآن والتوصيل صباحاً",
                                            style: getBoldStyle(
                                              color:
                                                  ColorManager.grayForMessage,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  state.homeData!.homeCategoriesList!.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 33, vertical: 13),
                                          child: CustomSectionName(
                                            sectionName:
                                                AppLocalizations.of(context)!
                                                    .sections,
                                            onTap: () {
                                              AppRouter.push(
                                                  context,
                                                  ALlSectionScreen(
                                                    index: 0,
                                                    tabControllerLength: state
                                                            .homeData!
                                                            .homeCategoriesList!
                                                            .length +
                                                        1,
                                                  ));
                                            },
                                          ),
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeCategoriesList!.isNotEmpty
                                      ? SizedBox(
                                          height: 300,
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
                                                    mainAxisSpacing: 15,
                                                    mainAxisExtent: 97,
                                                    crossAxisCount: 2),
                                            itemBuilder: (context, index) {
                                              return CustomCategory(
                                                onTap: () {
                                                  AppRouter.push(
                                                      context,
                                                      ALlSectionScreen(
                                                        index: index + 1,
                                                        tabControllerLength: state
                                                                .homeData!
                                                                .homeCategoriesList!
                                                                .length +
                                                            1,
                                                      ));
                                                },
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
                                          verticalPadding: state
                                                  .homeData!
                                                  .homeSuggestedProductsList!
                                                  .isNotEmpty
                                              ? 0
                                              : 10,
                                          bannerList: state.homeData!
                                              .homeBannerListTopSection,
                                          height: 164,
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeSuggestedProductsList!
                                          .isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16, bottom: 20),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 33,
                                                        vertical: 13),
                                                child: CustomSectionName(
                                                  sectionName:
                                                      AppLocalizations.of(
                                                              context)!
                                                          .suggested_products,
                                                  onTap: () {},
                                                ),
                                              ),
                                              SizedBox(
                                                height: 238,
                                                width: 1.sw,
                                                child: ListView.builder(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  itemCount: state
                                                      .homeData!
                                                      .homeSuggestedProductsList!
                                                      .length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        AppRouter.push(
                                                            context,
                                                            ProductDetailsScreen(
                                                              id: state
                                                                  .homeData!
                                                                  .homeSuggestedProductsList![
                                                                      index]
                                                                  .id,
                                                            ));
                                                      },
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional.only(
                                                                  bottom: 10,
                                                                  start:
                                                                      index == 0
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
                                                              isDisCount:
                                                                  state.homeData!.homeSuggestedProductsList![index].discountStatus == "1"
                                                                      ? true
                                                                      : false,
                                                              productInfo: state
                                                                  .homeData!
                                                                  .homeSuggestedProductsList![index])),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : const SizedBox(),
                                  state.homeData!.homeBannerListBottomSection!
                                          .isNotEmpty
                                      ? CustomHomeCursel(
                                          verticalPadding: state
                                                  .homeData!
                                                  .homeSuggestedProductsList!
                                                  .isNotEmpty
                                              ? 0
                                              : 10,
                                          bannerList: state.homeData!
                                              .homeBannerListBottomSection,
                                          height: 164,
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
                                              return GestureDetector(
                                                onTap: () {
                                                  AppRouter.push(
                                                      context,
                                                      ProductDetailsScreen(
                                                        id: state
                                                            .homeData!
                                                            .homeDiscountedProductsList![
                                                                index]
                                                            .id,
                                                      ));
                                                },
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(
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
                                                      productInfo: state
                                                              .homeData!
                                                              .homeDiscountedProductsList![
                                                          index]),
                                                ),
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
