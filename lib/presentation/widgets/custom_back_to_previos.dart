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
    return Container(
      width: 1.sw,
      height: 0.14.sw,
      decoration:  BoxDecoration(color: Colors.white,  boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.18),
          offset: const Offset(0, 2),
          blurRadius: 5.0,
      ),
      ],),
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
            const Icon(Icons.arrow_forward_ios,
            size: 20,
              color: ColorManager.grayForMessage,),

          ],
        ),
      ),
    );
  }
}

