import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/products_by_sub_category_id_response.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/translations.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final List<String> tabTitles = [
    "خضارو وفواكه ومكسرات",
    "مكسرات",
    "فواكه",
    "فواكه",
    "فواكه",
    "فواكه"
  ];
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                width: 1.sw,
                child: TabBar(
                  onTap: (value) {},
                  isScrollable: true,
                  indicatorColor: ColorManager.primaryGreen,
                  labelColor: ColorManager.primaryGreen,
                  unselectedLabelColor: ColorManager.grayForMessage,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: tabTitles.map((title) {
                    return Tab(
                      text: title,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: tabTitles.map((title) {
                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: 8,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  productInfo:
                                      ProductsBySubCategoryIdResponse(),
                                )));
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
