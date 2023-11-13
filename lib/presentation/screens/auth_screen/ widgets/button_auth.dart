
import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/style_app.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({
    Key? key,
    this.fillColor = ColorManager.primaryColor,
    this.isFilled = true,
    this.labelColor = Colors.white,
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
        width: MediaQuery.of(context).size.width-250,
        height: 50,
        decoration: BoxDecoration(
            color: isFilled ? fillColor : null,
            borderRadius:const BorderRadiusDirectional.all(
                 Radius.circular(50),
                ),
            boxShadow: ColorManager.boxShadow),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: getBoldStyle(color: labelColor, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
