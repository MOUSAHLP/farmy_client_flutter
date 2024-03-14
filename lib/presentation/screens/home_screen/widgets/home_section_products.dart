import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/home_section_all_products_bloc/home_section_all_products_bloc.dart';
import 'package:pharma/bloc/home_section_all_products_bloc/home_section_all_products_event.dart';
import 'package:pharma/bloc/home_section_all_products_bloc/home_section_all_products_state.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_no_dataa.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';
import 'package:pharma/presentation/widgets/custom_product_shimmer.dart';
import 'package:pharma/translations.dart';

class HomeSectionProducts extends StatelessWidget {
  final int sectionId;
  final String sectionName;
  const HomeSectionProducts(
      {Key? key, required this.sectionId, required this.sectionName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<HomeSectionAllProductsBloc>(
        lazy: true,
        create: (BuildContext context) => sl<HomeSectionAllProductsBloc>()
          ..add(GetHomeSectionAllProducts(id: sectionId)),
        child: Scaffold(
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              CustomAppBarScreen(
                sectionName: sectionName,
                isComeBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: PaddingApp.p40),
                  child: BlocConsumer<HomeSectionAllProductsBloc,
                      HomeSectionAllProductsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is HomeSectionAllProductsSuccess) {
                        if (context
                            .read<HomeSectionAllProductsBloc>()
                            .allProductResponse!
                            .isNotEmpty) {
                          return GridView.builder(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 5.w,
                            ),
                            itemCount: context
                                .read<HomeSectionAllProductsBloc>()
                                .allProductResponse!
                                .length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              // childAspectRatio: 15 / 2,
                              crossAxisCount: 2,
                              mainAxisSpacing: 26,
                              mainAxisExtent: 232,
                            ),
                            itemBuilder: (context, index) {
                              return Center(
                                child: GestureDetector(
                                  onTap: () {
                                    AppRouter.push(
                                      context,
                                      ProductDetailsScreen(
                                        id: context
                                            .read<HomeSectionAllProductsBloc>()
                                            .allProductResponse![index]
                                            .id,
                                      ),
                                    );
                                  },
                                  child: CustomProductCard(
                                    productInfo: context
                                        .read<HomeSectionAllProductsBloc>()
                                        .allProductResponse![index],

                                    // isDisCount: (context
                                    //             .read<HomeSectionAllProductsBloc>()
                                    //             .allProductResponse![index]
                                    //             .discountStatus ==
                                    //         "0")
                                    //     ? false
                                    //     : true,
                                  ),
                                ),
                              );
                            },
                          );
                        }

                        return CustomNoData(
                            noDataStatment:
                                AppLocalizations.of(context)!.thereIsNoProduct);
                      }

                      return const CustomProductShimmer();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
