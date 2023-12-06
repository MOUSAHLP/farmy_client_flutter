import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';
import 'package:pharma/translations.dart';

class CustomLabelWithPassField extends StatelessWidget {
  final String labelName;
  const CustomLabelWithPassField({super.key, required this.labelName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            labelName,
            style: getBoldStyle(
                color: ColorManager.grayForMessage, fontSize: FontSizeApp.s15),
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: InputFieldAuth(
            color: ColorManager.grayForm,
            width: 1.sw,
            hintText: "***********************",
          ),
        ),
      ],
    );
  }
}
