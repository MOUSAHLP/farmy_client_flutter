import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomInvoicesRow extends StatelessWidget {
  final String label;
  final String valueOfLabel;
  final Color? colorText;
  final TextStyle? textStyle;

  const CustomInvoicesRow({
    super.key,
    required this.label,
    required this.valueOfLabel,
    this.colorText, this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (valueOfLabel == null || valueOfLabel == "" || valueOfLabel == "null") {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
              style: textStyle ?? getBold2Style(
                color: colorText ?? ColorManager.grayForMessage,
                fontSize: FontSizeApp.s13.sp,
              ),
          ),
          const SizedBox(
            width: 3,
          ),
          Expanded(
            child: Text(
              valueOfLabel,
              style: getBold2Style(
                color: colorText ?? ColorManager.grayForMessage,
                fontSize: FontSizeApp.s13.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
