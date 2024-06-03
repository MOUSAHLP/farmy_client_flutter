import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/categories_bloc/categories_bloc.dart';
import 'package:pharma/models/categories_respoonse.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';

class CustomCategoryScreen extends StatelessWidget {
  final List<CategoriesResponse>? categoriesList;
  final TabController tabController;

  const CustomCategoryScreen({
    super.key,
    required this.categoriesList,
    required this.tabController,
  });

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
              context.read<CategoriesBloc>().add(GetSubCategoryEvent(tabIndex: index + 1, categoryId: categoriesList![index].id));
              tabController.animateTo(index + 1);
            },
            child: CustomCategory(
              categoryName: categoriesList![index].name!,
              categoryImage: categoriesList![index].imageUrl ?? "",
            ));
      },
    );
  }
}
