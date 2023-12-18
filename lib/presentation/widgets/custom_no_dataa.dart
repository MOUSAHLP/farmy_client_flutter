import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomNoData extends StatelessWidget {
  final String noDataStatment;
  const CustomNoData({super.key, required this.noDataStatment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageManager.placeholderLogo),
        Text(
          noDataStatment,
          style: getUnderBoldStyle(color: ColorManager.grayForMessage),
        )
      ],
    );
  }
}
