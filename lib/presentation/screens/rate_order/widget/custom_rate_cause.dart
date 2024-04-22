import 'package:flutter/material.dart';
import 'package:pharma/models/rate_attribute.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomRateCause extends StatelessWidget {

  final RateAttribute rateAttribute;
  final Function() onTab;
  final List selectedAttribute;

  const CustomRateCause({
    super.key,
    required this.rateAttribute,
    required this.onTab,
  required this.selectedAttribute
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTab,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: selectedAttribute.contains(rateAttribute)?ColorManager.primaryGreen:ColorManager.lightGray,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            rateAttribute.value,
            textAlign: TextAlign.center,
            style: getRegularStyle(
                color:selectedAttribute.contains(rateAttribute)?ColorManager.white: ColorManager.grayForMessage, fontSize: FontSizeApp.s14),
          ),
        ));
  }
}
