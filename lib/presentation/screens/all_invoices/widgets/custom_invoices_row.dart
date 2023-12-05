import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomInvoicesRow extends StatelessWidget {
  final String label;
  final String valueOfLabel;
  final Color? colorText;
  const CustomInvoicesRow(
      {super.key,
      required this.label,
      required this.valueOfLabel,
      this.colorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Text(
            label,
            style: getBoldStyle(
                color: colorText ?? ColorManager.grayForMessage,
                fontSize: FontSizeApp.s13),
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            valueOfLabel,
            style: getBoldStyle(
                color: colorText ?? ColorManager.grayForMessage,
                fontSize: FontSizeApp.s13),
          ),
        ],
      ),
    );
  }
}
