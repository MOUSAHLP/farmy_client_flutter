import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';

class CustomCountWidget extends StatelessWidget {
  final IconData myIcon;
  final Function() onTap;
  final double height;
  final double width;

  const CustomCountWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.myIcon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorManager.primaryGreen,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          myIcon,
          color: ColorManager.white,
        ),
      ),
    );
  }
}
