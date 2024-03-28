import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomJobRow extends StatelessWidget {
  const CustomJobRow({super.key,required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: getBoldStyle(
              color: ColorManager.grayForMessage, fontSize: FontSizeApp.s18),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            color: ColorManager.grayForSearch,
          ),
        )
      ],
    );
  }
}
