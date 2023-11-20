
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/style_app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.fillColor = ColorManager.primaryGreen,
    this.borderColor,
    this.isFilled = false,
    this.labelColor = Colors.white,
    required this.label,
    this.onTap,

  }) : super(key: key);
  final Color fillColor;
  final bool isFilled;
  final Color labelColor;
  final Color? borderColor;
  final String label;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
        onTap,
      child: Container(
        width: 1.sw-50,
        height: 47,
        decoration: BoxDecoration(
           color:isFilled? fillColor:null,
            borderRadius: BorderRadius.circular(12),
          border: Border.all(color:borderColor??Colors.transparent,width: 2),
            gradient:!isFilled?ColorManager.linearGradientPrimary:null
            // boxShadow: isFilled
            //     ?ColorManager.boxShadow
            //     : []
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              label,
              style: getBoldStyle(
                color: labelColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
