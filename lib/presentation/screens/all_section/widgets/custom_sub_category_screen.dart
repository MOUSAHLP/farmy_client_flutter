import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/categories_bloc/categories_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/models/categories_respoonse.dart';
import 'package:pharma/models/sub_category_response.dart';
import 'package:pharma/presentation/screens/all_product/all_product_screen.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';

class CustomSubCategoryScreen extends StatelessWidget {
  final List<SubCategoryResponse>? subCategoriesList;
  final TabController tabController;

  const CustomSubCategoryScreen(
      {super.key, this.subCategoriesList, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return subCategoriesList!.isEmpty
        ? Text("there is no data")
        : GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: subCategoriesList!.length,
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
                        AllLProductScreen(
                          subCategoryList: subCategoriesList,
                          index: index,
                        ));
                  },
                  child: CustomCategory(
                      categoryName:
                          subCategoriesList![index].subCategoryName!));
            },
          );
  }
}
