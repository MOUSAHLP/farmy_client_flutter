import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../resources/color_manager.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          baseColor: ColorManager.grayForPlaceholde,
          highlightColor: const Color(0xFFe2e4e9),
          child: Container(
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(10),
                border: const Border(
                  left: BorderSide(color: ColorManager.grayForMessage),
                  right: BorderSide(color: ColorManager.grayForMessage),
                  top: BorderSide(
                      color: ColorManager
                          .grayForMessage), // White border at the top
                  bottom: BorderSide(
                      color: ColorManager
                          .grayForMessage), // White border at the bottom
                )),
            width: 1.sw,
            height: 61,
          ),
        ),
      );
    },);
  }
}
