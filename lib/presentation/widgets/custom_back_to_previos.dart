import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import '../resources/assets_manager.dart';

class CustomBackToPrevios extends StatelessWidget {
  final String sectionName;
  const CustomBackToPrevios({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.12.sw,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionName,
              style: getBoldStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s15),
            ),
            Image.asset(
              ImageManager.goForAllAdress,
              width: 28,
              height: 29,
              color: ColorManager.grayForMessage,
            )
          ],
        ),
      ),
    );
  }
}
