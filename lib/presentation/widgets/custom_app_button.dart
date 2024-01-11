import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomAppButton extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Function ()ontap;
  final String myText;
  final double? width;
  final double? height;
  const CustomAppButton(
      {super.key,
      required this.padding,  
      required this.myText,
      required this.ontap,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: padding,
        child: Container(
          width: width ?? 1.sw,
          height: height ?? 47,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[ColorManager.primaryGreen, ColorManager.softGreen],
            ),
          ),
          child: Center(
            child: Text(
              myText,
              style: getBoldStyle(
                  color: ColorManager.white, fontSize: FontSizeApp.s13),
            ),
          ),
        ),
      ),
    );
  }
}
