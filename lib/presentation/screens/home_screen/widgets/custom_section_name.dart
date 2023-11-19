import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomSectionName extends StatelessWidget {
  final String sectionName;
  final Function()? onTap;
  const CustomSectionName(
      {super.key, required this.sectionName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionName,
          style: getMoreBoldStyle(
              color: ColorManager.primaryGreen, fontSize: FontSizeApp.s15),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "رؤية المزيد",
            style: getMoreBoldStyle(
                color: ColorManager.grayForMessage, fontSize: FontSizeApp.s13),
          ),
        )
      ],
    );
  }
}
