import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomNoData extends StatelessWidget {
  final String noDataStatment;
  const CustomNoData({super.key, required this.noDataStatment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 106,
        ),
        Image.asset(ImageManager.placeholderLogo),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 20),
          child: Text(
            noDataStatment,
            style: getUnderBoldStyle(
                color: ColorManager.grayForSearch, fontSize: FontSizeApp.s16),
          ),
        )
      ],
    );
  }
}
