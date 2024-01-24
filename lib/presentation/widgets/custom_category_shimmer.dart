import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/widgets/custom_category.dart';
import 'package:shimmer/shimmer.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.grayForPlaceholder,
      highlightColor: const Color(0xFFe2e4e9),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            mainAxisExtent: 135,
            crossAxisCount: 3),
        itemBuilder: (context, index) {
          return  CustomCategory(categoryName: "");
        },
      ),
    );
  }
}
