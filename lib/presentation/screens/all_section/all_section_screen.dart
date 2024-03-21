import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/categories_bloc/categories_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/all_section/widgets/custom_category_screen.dart';
import 'package:pharma/presentation/screens/all_section/widgets/custom_sub_category_screen.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';
import 'package:pharma/presentation/widgets/custom_category_shimmer.dart';
import 'package:pharma/presentation/widgets/custom_loading_widget.dart';
import 'package:pharma/translations.dart';

class ALlSectionScreen extends StatelessWidget {
  const ALlSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<CategoriesBloc>()..add(GetCaegoriesEvent()),
        child: const ALlSectionScreenBody());
  }
}

class ALlSectionScreenBody extends StatefulWidget {
  const ALlSectionScreenBody({Key? key}) : super(key: key);

  @override
  State<ALlSectionScreenBody> createState() {
    return _ALlSectionScreenBodyState();
  }
}

class _ALlSectionScreenBodyState extends State<ALlSectionScreenBody>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        TabController tabController =
            TabController(length: state.tabs.length, vsync: this);
        tabController.animateTo(state.tabIndex);

        return SafeArea(
          child: Scaffold(
            body: (state.screenState == ScreenState.loading && state.tabs.isEmpty)
                ? const CustomLoadingWidget()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBarScreen(
                        sectionName: AppLocalizations.of(context)!.all_section,
                      ),
                      TabBar(
                        padding: EdgeInsetsDirectional.only(start: 10.w),
                        tabAlignment: TabAlignment.start,
                        controller: tabController,
                        isScrollable: true,
                        indicatorColor: ColorManager.primaryGreen,
                        labelColor: ColorManager.primaryGreen,
                        unselectedLabelColor: ColorManager.grayForMessage,
                        dividerColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.tab,
                        onTap: (index) {
                          tabController.animateTo(index);
                          if (index == 0) {
                            if (state.categoriesList.isEmpty) {
                              context
                                  .read<CategoriesBloc>()
                                  .add(GetCaegoriesEvent());
                            } else {
                              context
                                  .read<CategoriesBloc>()
                                  .add(AllProductsPageEvent());
                            }
                          } else if (state.previousSubCategoryIndex ==
                              index) {
                            context.read<CategoriesBloc>().add(
                                  SubCategoryPageEvent(
                                    tabIndex: index,
                                  ),
                                );
                          } else {
                            if (state.tabIndex != index) {
                              context.read<CategoriesBloc>().add(
                                    GetSubCategoryEvent(
                                      tabIndex: index,
                                      categoryId:
                                          state.categoriesList[index - 1].id,
                                    ),
                                  );
                            }
                          }
                        },
                        tabs: state.tabs,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: IndexedStack(
                          index: tabController.index,
                          children: [
                            if (state.categoriesList.isNotEmpty)
                              CustomCategoryScreen(
                                categoriesList: state.categoriesList,
                                tabController: tabController,
                              ),
                            ...state.categoriesList.map((title) {
                              return state.screenState == ScreenState.loading
                                  ? const CustomCategoryShimmer()
                                  : CustomSubCategoryScreen(
                                      subCategoriesList: state.subCategoryList,
                                      tabController: tabController,
                                    );
                            }).toList()
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
