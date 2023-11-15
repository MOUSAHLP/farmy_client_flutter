import 'package:flutter/material.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';

class CustomSubCategory extends StatelessWidget {
  const CustomSubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 17,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 23,
          mainAxisSpacing: 20,
          mainAxisExtent: 134,
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Container(child: CustomCategory(categoryName: "asd"));
      },
    );
  }
}
