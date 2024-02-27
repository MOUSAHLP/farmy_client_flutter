import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/products_bloc/products_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/models/sub_category_response.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_no_dataa.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/presentation/widgets/custom_product_shimmer.dart';
import 'package:pharma/translations.dart';

import '../../resources/color_manager.dart';
import '../../widgets/custom_app_bar_screen.dart';

class AllProductScreen extends StatelessWidget {
  final List<SubCategoryResponse>? subCategoryList;
  int index;

  AllProductScreen(
      {super.key, required this.subCategoryList, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsBloc>()
        ..add(GetProductsBySubCategoryId(id: subCategoryList![index].id!)),
      child: AllProductBody(subCategoryList: subCategoryList, index: index),
    );
  }
}

class AllProductBody extends StatefulWidget {
  final List<SubCategoryResponse>? subCategoryList;
  int index;

  AllProductBody(
      {super.key, required this.subCategoryList, required this.index});

  @override
  State<AllProductBody> createState() => _AllLProductBodyState();
}

class _AllLProductBodyState extends State<AllProductBody>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.subCategoryList!.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return DefaultTabController(
          length: widget.subCategoryList!.length,
          initialIndex: widget.index,
          child: SafeArea(
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const CustomBackToPrevios(
                  //   sectionName: "فليفلة",
                  // ),
                  CustomAppBarScreen(
                      sectionName: widget
                          .subCategoryList![widget.index].subCategoryName!),
                  SizedBox(
                    width: 1.sw,
                    child: TabBar(
                      onTap: (value) {
                        context.read<ProductsBloc>().add(
                            GetProductsBySubCategoryId(
                                id: widget.subCategoryList![value].id!));
                      },
                      isScrollable: true,
                      indicatorColor: ColorManager.primaryGreen,
                      labelColor: ColorManager.primaryGreen,
                      unselectedLabelColor: ColorManager.grayForMessage,
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: widget.subCategoryList!.map((title) {
                        return Tab(
                          text: title.subCategoryName,
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: IndexedStack(
                      children: widget.subCategoryList!.map((title) {
                        return state.screenState == ScreenState.loading
                            ? const CustomProductShimmer()
                            : state.screenState == ScreenState.success
                                ? state.productsList.isNotEmpty
                                    ? GridView.builder(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        itemCount: state.productsList.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                // childAspectRatio: 144 / 233,
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 26,
                                                mainAxisExtent: 232),
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: GestureDetector(
                                                  onTap: () {
                                                    AppRouter.push(
                                                        context,
                                                        ProductDetailsScreen(
                                                          id: state
                                                              .productsList[
                                                                  index]
                                                              .id,
                                                        ));
                                                  },
                                                  child: CustomProductCard(

                                                      productInfo: state
                                                          .productsList[index],
                                                      // isDisCount: (state
                                                      //             .productsList[
                                                      //                 index]
                                                      //             .discountStatus ==
                                                      //         "0")
                                                      //     ? false
                                                      //     : true
                                              )
                                              ));
                                        },
                                      )
                                    : CustomNoData(
                                        noDataStatment:
                                            AppLocalizations.of(context)!
                                                .thereIsNoProduct)
                                : const SizedBox();
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
