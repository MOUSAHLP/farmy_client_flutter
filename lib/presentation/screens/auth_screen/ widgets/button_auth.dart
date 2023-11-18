
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/style_app.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({
    Key? key,
    this.fillColor = Colors.white,
    this.isFilled = true,
    this.labelColor = ColorManager.primaryGreen,
    required this.label,
    this.onTap,
  }) : super(key: key);
  final Color fillColor;
  final bool isFilled;
  final Color labelColor;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:1.sw-150,
        // width:249,
        height:47,
        decoration: BoxDecoration(
            color: isFilled ? fillColor : null,
            borderRadius:const BorderRadiusDirectional.all(
                 Radius.circular(12),
                ),
           ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: getBoldStyle(color: labelColor, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
