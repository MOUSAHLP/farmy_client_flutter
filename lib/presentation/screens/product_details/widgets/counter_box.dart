import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';

class CustomCountWidget extends StatelessWidget {
  final IconData myIcon;
  final Function() onTap;
  const CustomCountWidget(
      {super.key, required this.myIcon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
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
