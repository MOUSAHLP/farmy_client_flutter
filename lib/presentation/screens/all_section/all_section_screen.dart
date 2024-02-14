import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/categories_bloc/categories_bloc.dart';
import 'package:pharma/bloc/home_bloc/home_bloc.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/models/categories_respoonse.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/all_section/widgets/custom_category_screen.dart';
import 'package:pharma/presentation/screens/all_section/widgets/custom_sub_category_screen.dart';
import 'package:pharma/presentation/widgets/custom_category_shimmer.dart';
import 'package:pharma/presentation/widgets/custom_no_dataa.dart';
import 'package:pharma/translations.dart';

import '../../widgets/custom_app_bar_screen.dart';

class ALlSectionScreen extends StatelessWidget {
  final int index;
  final int tabControllerLength;
  const ALlSectionScreen(
      {super.key, required this.index, required this.tabControllerLength});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoriesBloc>(),
      child: ALlSectionScreenBody(
          index: index, tabControllerLength: tabControllerLength),
    );
  }
}

class ALlSectionScreenBody extends StatefulWidget {
  final int index;
  final int tabControllerLength;
  const ALlSectionScreenBody(
      {super.key, required this.index, required this.tabControllerLength});

  @override
  State<ALlSectionScreenBody> createState() => _ALlSectionScreenBodyState();
}

class _ALlSectionScreenBodyState extends State<ALlSectionScreenBody>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<CategoriesResponse> categoriesList = [];
  @override
  void initState() {
    categoriesList =
        List.from(context.read<HomeBloc>().state.homeData!.homeCategoriesList!);
    categoriesList.insert(0, CategoriesResponse(id: 0, name: "All Products"));
    _tabController =
        TabController(length: widget.tabControllerLength, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.index != 0) {
        context.read<CategoriesBloc>().add(
            GetSubCategoryEvent(categoryId: categoriesList[widget.index].id));
        _tabController.animateTo(widget.index);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
                // height: 420,
                child: context
                        .read<HomeBloc>()
                        .state
                        .homeData!
                        .homeCategoriesList!
                        .isEmpty
                    ?
                    //there is no data
                    CustomNoData(
                        noDataStatment:
                            AppLocalizations.of(context)!.thereIsNoCategory)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBarScreen(
                              sectionName:
                                  AppLocalizations.of(context)!.all_section),
                          SizedBox(
                            width: 1.sw,
                            child: TabBar(
                              controller: _tabController,
                              onTap: (value) {
                                if (value == 0) {
                                  context
                                      .read<CategoriesBloc>()
                                      .add(GetCaegoriesEvent());
                                } else {
                                  context.read<CategoriesBloc>().add(
                                      GetSubCategoryEvent(
                                          categoryId: categoriesList[
                                                  _tabController.index]
                                              .id));
                                }
                              },
                              isScrollable: true,
                              indicatorColor: ColorManager.primaryGreen,
                              labelColor: ColorManager.primaryGreen,
                              unselectedLabelColor: ColorManager.grayForMessage,
                              dividerColor: Colors.transparent,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: categoriesList.map((categoryList) {
                                return Tab(
                                  text: categoryList.name,
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: IndexedStack(
                              index: _tabController.index,
                              children: categoriesList.map((title) {
                                return _tabController.index == 0
                                    ? CustomCategoryScreen(
                                        categoriesList: categoriesList,
                                        tabController: _tabController)
                                    : state.isCategoryLoading == true
                                        ? const CustomCategoryShimmer()
                                        : CustomSubCategoryScreen(
                                            subCategoriesList:
                                                _tabController.index != 0
                                                    ? state.subCategoryList
                                                    : [],
                                            tabController: _tabController,
                                          );
                              }).toList(),
                            ),
                          ),
                        ],
                      )),
          ),
        );
      },
    );
  }
}
