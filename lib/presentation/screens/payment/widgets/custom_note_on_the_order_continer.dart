import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomNoteOnTheOrder extends StatelessWidget {
  final String noteText;
  const CustomNoteOnTheOrder({super.key, required this.noteText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: ColorManager.primaryGreen),
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          noteText,
          style: getRegularStyle(
              color: ColorManager.grayForMessage, fontSize: FontSizeApp.s14),
        ),
      ],
    );
  }
}
