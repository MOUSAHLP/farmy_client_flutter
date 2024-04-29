import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';

class CustomLabelWithPassField extends StatelessWidget {
  final String labelName;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomLabelWithPassField({super.key, required this.labelName,required this.controller,this.validator});

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
            textDirection: TextDirection.ltr,

            controller: controller,
            color: ColorManager.grayForm,
            width: 1.sw,
            hintText: "***********************",
            validator:validator ,
          ),
        ),
      ],
    );
  }
}
