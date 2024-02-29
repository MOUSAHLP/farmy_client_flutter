import 'package:flutter/material.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/sub_category_response.dart';
import 'package:pharma/presentation/screens/all_product/all_product_screen.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';
import 'package:pharma/presentation/widgets/custom_no_dataa.dart';
import 'package:pharma/translations.dart';

class CustomSubCategoryScreen extends StatefulWidget {
  final List<SubCategoryResponse>? subCategoriesList;
  final TabController tabController;

  const CustomSubCategoryScreen({
    super.key,
    this.subCategoriesList,
    required this.tabController,
  });

  @override
  State<CustomSubCategoryScreen> createState() =>
      _CustomSubCategoryScreenState();
}

class _CustomSubCategoryScreenState extends State<CustomSubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.subCategoriesList!.isEmpty
        ? Center(
            child: CustomNoData(
                noDataStatment:
                    AppLocalizations.of(context)!.thereIsNoSubCategory))
        : GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: widget.subCategoriesList!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                mainAxisExtent: 135,
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    AppRouter.push(
                        context,
                        AllProductScreen(
                          subCategoryList: widget.subCategoriesList,
                          index: index,
                        ));
                  },
                  child: CustomCategory(
                      categoryName:
                          widget.subCategoriesList![index].subCategoryName!));
            },
          );
  }
}
