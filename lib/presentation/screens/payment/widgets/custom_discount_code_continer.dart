import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomDiscountCodeContiner extends StatelessWidget {
  final String subjectText;
  const CustomDiscountCodeContiner({super.key, required this.subjectText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorManager.grayForMessage,
            width: 1,
          )),
      child: Row(
        children: [
          const SizedBox(
            width: 17,
          ),
          Image.asset(ImageManager.farmySmile),
          const SizedBox(
            width: 8,
          ),
          Text(
            subjectText,
            style: getMoreBoldStyle(color: ColorManager.grayForMessage),
          ),
        ],
      ),
    );
  }
}
