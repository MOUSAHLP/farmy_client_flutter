
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color_manager.dart';
import '../resources/style_app.dart';

class PasswordInputFieldAuth extends StatefulWidget {
  const PasswordInputFieldAuth({
    this.fillColor,
    this.fillIconColor=ColorManager.primaryGreen,
    this.hintText,
    this.textStyle=const TextStyle(color: ColorManager.primaryGreen),
    Key? key,
    this.controller,
    this.errorMessage,
    this.onChange,
    this.textAlign = TextAlign.start,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 4),
    this.height = 54,
    this.withLabel = false,
    this.icon,
    this.validator,
  }) : super(key: key);
  final TextAlign textAlign;
  final String? hintText;
  final Color? fillColor;
  final Color? fillIconColor;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final String? errorMessage;
  final Function(String value)? onChange;
  final EdgeInsets? contentPadding;
  final double? height;
  final bool withLabel;
  final String? icon;
  final String? Function(String?)? validator;
  @override
  State<PasswordInputFieldAuth> createState() =>
      _PasswordInputFieldAuthState();
}

class _PasswordInputFieldAuthState extends State<PasswordInputFieldAuth> {
  bool obscure = true;
  String? validationErrorMessage;

  void toggleObscure() {
    setState(() {
      obscure = !obscure;
    });
  }

  void validateField(String? value) {
    setState(() {
      validationErrorMessage = widget.validator!(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          width:  1.sw - 100,
          decoration: BoxDecoration(
            // boxShadow: ColorManager.boxShadow,
            border: Border.all(
                color: Colors.transparent, width: 1),
            borderRadius: const BorderRadiusDirectional.all(
              Radius.circular(12),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child:  SvgPicture.asset(
                    widget.icon??"",
                    height: 20,
                    width: 20,
                    // color:widget.fillIconColor ,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    style: widget.textStyle,
                    controller: widget.controller,
                    onChanged: widget.onChange,
                    obscureText: obscure,
                    validator: (value) {
                      if (widget.validator == null) return null;
                      validateField(value);
                      return widget.validator!(value);
                    },
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFEEF6F6),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: widget.withLabel ? null : widget.hintText,
                      label: widget.withLabel
                          ? Text(
                              widget.hintText!,
                              style: const TextStyle(
                                  color: ColorManager.grayForSearchProduct,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )
                          : null,
                      errorStyle: const TextStyle(
                        fontSize: 0,
                        height: 0.1,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () => toggleObscure(),
                        child: Icon(
                          Icons.remove_red_eye,
                          color:
                              obscure ? Colors.grey : ColorManager.primaryGreen,
                        ),
                      ),
                      contentPadding: widget.contentPadding,
                      hintStyle: getBoldStyle(
                        color: ColorManager.grayForSearchProduct,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28.0)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28.0)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.errorMessage != null || validationErrorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 18, left: 18),
            child: Text(
              widget.errorMessage ?? validationErrorMessage ?? '',
              style: getBoldStyle(
                color: ColorManager.yellow,
              ),
            ),
          ),
      ],
    );
  }
}
