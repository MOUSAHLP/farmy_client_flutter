import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/bloc/categories_bloc/categories_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/core/services/services_locator.dart';
import 'package:pharma/data/repos/categories_repo.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/screens/all_product/all_product_screen.dart';
import 'package:pharma/translations.dart';

import '../../widgets/custom_app_bar_screen.dart';
import 'widgets/custom_sub_category.dart';

class ALlSectionScreen extends StatelessWidget {
  const ALlSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoriesBloc>()..add(GetCaegoriesEvent()),
      child: ALlSectionScreenBody(),
    );
  }
}

class ALlSectionScreenBody extends StatefulWidget {
  ALlSectionScreenBody({super.key});

  @override
  State<ALlSectionScreenBody> createState() => _ALlSectionScreenBodyState();
}

class _ALlSectionScreenBodyState extends State<ALlSectionScreenBody>
    with TickerProviderStateMixin {
  List<String> tabTitles = [
    "خضارو وفواكه ومكسرات",
    "مكسرات",
    "فواكه",
    "فواكه",
    "فواكه",
    "فواكه"
  ];
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
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
        if (_tabController.length != state.categoriesList.length) {
          _tabController.dispose();
          _tabController =
              TabController(length: state.categoriesList.length, vsync: this);
        }

        return SafeArea(
          child: Scaffold(
            body: SizedBox(
                // height: 420,
                child: state.screenState == ScreenState.loading
                    ? const CircularProgressIndicator()
                    : state.screenState == ScreenState.success
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomAppBarScreen(
                                  sectionName: AppLocalizations.of(context)!
                                      .all_section),
                              SizedBox(
                                width: 1.sw,
                                child: TabBar(
                                  controller: _tabController,
                                  onTap: (value) {
                                    if (value != 0) {
                                      context.read<CategoriesBloc>().add(
                                          GetSubCategoryEvent(
                                              categoryId: state
                                                  .categoriesList[
                                                      _tabController.index]
                                                  .id));
                                    }
                                  },
                                  isScrollable: true,
                                  indicatorColor: ColorManager.primaryGreen,
                                  labelColor: ColorManager.primaryGreen,
                                  unselectedLabelColor:
                                      ColorManager.grayForMessage,
                                  dividerColor: Colors.transparent,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  tabs:
                                      state.categoriesList.map((categoryList) {
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
                                child: TabBarView(
                                  controller: _tabController,
                                  children: state.categoriesList.map((title) {
                                    return GestureDetector(
                                        onTap: () {},
                                        child: CustomSubCategory(
                                            tabController: _tabController,
                                            categoriesList: state.categoriesList
                                                        .indexOf(title) ==
                                                    0
                                                ? state.categoriesList
                                                : []));
                                  }).toList(),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox()),
          ),
        );
      },
    );
  }
}
