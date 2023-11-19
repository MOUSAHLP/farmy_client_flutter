import 'package:flutter/material.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';

class CustomSubCategory extends StatelessWidget {
  const CustomSubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: 17,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          mainAxisExtent: 135,
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Container(child: CustomCategory(categoryName: "asd"));
      },
    );
  }
}
