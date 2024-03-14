import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

class CustomCategory extends StatelessWidget {
  final String categoryName;
  final String? categoryImage;
  final Function()? onTap;
  final double? textHieght;
  CustomCategory(
      {super.key,
      required this.categoryName,
      this.textHieght,
      this.onTap,
      this.categoryImage});
  final List<Color> colorOptions = [
    const Color(0xFFC05E47),
    const Color(0xFFCA2928),
    const Color(0xFF578A4A),
    const Color(0xFFE3B341),
    const Color(0xFFC48572),
    const Color(0xFFA12120),
    const Color(0xFFE97759),
    const Color(0xFF023DB9),
    const Color(0xFFFFFFFF),
  ];
  Color getChartColor() {
    Random random = Random();
    int index = random.nextInt(colorOptions.length);
    Color select = colorOptions[index];
    colorOptions.removeAt(index);
    return select;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 97,
            width: 97,
            decoration:  const BoxDecoration(
                // border: Border.all(color: getChartColor(), width: 2),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      offset: Offset(0, -3),
                      color: ColorManager.grayForPlaceholder)
                ],
                color: ColorManager.grayForPlaceholder,
                shape: BoxShape.circle),
            child: ClipOval(
              child: CachedImage(
                imageUrl: categoryImage,
              ),
            ),
          ),
          SizedBox(
            height: textHieght ?? 10,
          ),
          SizedBox(
            height: textHieght ?? 24,
            child: Text(
              categoryName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: getBoldStyle(
                color: ColorManager.black,
                fontSize: FontSizeApp.s13,
              )!
                  .copyWith(
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
