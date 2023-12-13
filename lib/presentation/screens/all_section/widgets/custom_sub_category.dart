import 'package:flutter/material.dart';
import 'package:pharma/models/parms/categories_respoonse.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';

class CustomSubCategory extends StatelessWidget {
  final List<CategoriesResponse>? categoriesList;
  final CategoriesResponse? categories;
  final TabController tabController;
  const CustomSubCategory(
      {super.key,
      this.categoriesList,
      this.categories,
      required this.tabController});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: categoriesList!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          mainAxisExtent: 135,
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              tabController.animateTo(index);
            },
            child: CustomCategory(categoryName: categoriesList![index].name!));
      },
    );
  }
}
