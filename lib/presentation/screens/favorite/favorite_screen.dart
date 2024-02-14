import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/guest_screen/guest_screen.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/translations.dart';

import '../../../bloc/authentication_bloc/authertication_bloc.dart';
import '../../../bloc/favorite_bloc/favorite_bloc.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../../../models/categories_respoonse.dart';
import '../../widgets/custom_no_dataa.dart';
import '../../widgets/custom_product_shimmer.dart';

class AllFavoritesScreen extends StatelessWidget {
  const AllFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoriteScreen();
  }
}

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<CategoriesResponse> tabTitles = [];

  @override
  void initState() {
    tabTitles =
        List.from(context.read<HomeBloc>().state.homeData!.homeCategoriesList!);
    tabTitles.insert(0, CategoriesResponse(id: 0, name: "All Products"));
    _tabController = TabController(length: tabTitles.length, vsync: this);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (widget.index != 0) {
    //     context.read<CategoriesBloc>().add(
    //         GetSubCategoryEvent(categoryId: categoriesList[widget.index].id));
    //     _tabController.animateTo(widget.index);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return DefaultTabController(
          length: tabTitles.length,
          initialIndex: 0,
          child: SafeArea(
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomAppBarScreen(
                      sectionName: AppLocalizations.of(context)!.favorite),
                  sl<AuthenticationBloc>().loggedIn
                      ? Expanded(
                          child: Column(
                          children: [
                            SizedBox(
                              width: 1.sw,
                              child: TabBar(
                                controller: _tabController,
                                onTap: (value) {},
                                isScrollable: true,
                                indicatorColor: ColorManager.primaryGreen,
                                labelColor: ColorManager.primaryGreen,
                                unselectedLabelColor:
                                    ColorManager.grayForMessage,
                                dividerColor: Colors.transparent,
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: tabTitles.map((title) {
                                  return Tab(text: title.name);
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: tabTitles.map((title) {
                                  return state.screenState ==
                                          ScreenState.loading
                                      ? const CustomProductShimmer()
                                      : state.screenState == ScreenState.success
                                          ? state.favoritesList.isNotEmpty
                                              ? buildGridView(state)
                                              : CustomNoData(
                                                  noDataStatment:
                                                      AppLocalizations.of(
                                                              context)!
                                                          .thereIsNoProduct)
                                          : const SizedBox();
                                }).toList(),
                              ),
                            ),
                          ],
                        ))
                      : const Expanded(child: GuestScreen()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GridView buildGridView(FavoriteState state) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: 8, //state.favoritesList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // childAspectRatio: 144 / 233,
          crossAxisCount: 2,
          mainAxisSpacing: 26,
          mainAxisExtent: 226),
      itemBuilder: (context, index) {
        return Center(
            child: GestureDetector(
                onTap: () {
                  AppRouter.push(
                      context,
                      const ProductDetailsScreen(
                        id: 1,
                      ));
                },
                child: CustomProductCard(
                  isSellerFound: false,
                  isDisCount: true,
                  productInfo: ProductsBySubCategoryIdResponse.init(),
                )));
      },
    );
  }
}
