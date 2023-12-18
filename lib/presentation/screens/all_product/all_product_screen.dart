import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/sub_category_response.dart';
import 'package:pharma/presentation/screens/product_details/product_details_screen.dart';
import 'package:pharma/presentation/widgets/custom_prdouct_card.dart';

import '../../resources/color_manager.dart';
import '../../widgets/custom_app_bar_screen.dart';

class AllLProductScreen extends StatefulWidget {
  final List<SubCategoryResponse>? subCategoryList;
  int index;
  AllLProductScreen(
      {super.key, required this.subCategoryList, required this.index});

  @override
  State<AllLProductScreen> createState() => _AllLProductScreenState();
}

class _AllLProductScreenState extends State<AllLProductScreen>
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
                  sectionName:
                      widget.subCategoryList![widget.index].subCategoryName!),
              SizedBox(
                width: 1.sw,
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      widget.index = value;
                    });
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
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: widget.subCategoryList!.map((title) {
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
                                      context, const ProductDetailsScreen());
                                },
                                child:
                                    const CustomProductCard(isDisCount: true)));
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
