
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';


class InputFieldAuth extends StatefulWidget {
  const InputFieldAuth(
      {
        this.fillColor,
        this.fillIconColor=ColorManager.primaryGreen,
      this.hintText,
      this.keyboardType,
      this.textStyle=const TextStyle(color: ColorManager.primaryGreen),
      this.suffixIcon,
      Key? key,
      this.controller,
      this.readOnly = false,
      this.textAlign = TextAlign.start,
      this.onTab,
      this.errorMessage,
      this.onChange,
      this.minLines,
      this.maxLines,
      this.contentPadding = const EdgeInsets.symmetric(horizontal: 4),
      this.height = 56,
      this.initValue,
      this.withLabel = false,
      this.inputFormatters,
      this.icon,
      this.validator})
      : super(key: key);

  final String? hintText;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Color? fillIconColor;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool readOnly;
  final TextAlign textAlign;
  final void Function()? onTab;
  final String? errorMessage;
  final Function(String value)? onChange;
  final int? minLines;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final double? height;
  final String? initValue;
  final bool withLabel;
  final List<TextInputFormatter>? inputFormatters;
  final String? icon;
  final String? Function(String?)? validator;

  @override
  State<InputFieldAuth> createState() => _InputFieldAuthState();
}

class _InputFieldAuthState extends State<InputFieldAuth> {

  String? validationErrorMessage;

  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = widget.controller ?? TextEditingController();
    super.initState();
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
          width: MediaQuery.of(context).size.width-100,
          decoration: BoxDecoration(
           // boxShadow: ColorManager.boxShadow,
            border: Border.all(color: ColorManager.primaryGreen,width: 1),
            borderRadius: const BorderRadiusDirectional.all(
                 Radius.circular(12)
                ,),
            color: Colors.white ,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: SvgPicture.asset(
                    widget.icon??"",
                    height: 20,
                    width: 20,
                    // color:widget.fillIconColor ,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: widget.initValue,
                    keyboardType: widget.keyboardType,
                    onTap: widget.onTab,
                    style:widget.textStyle,
                    controller: widget.controller,
                    readOnly: widget.readOnly,
                    minLines: widget.minLines,
                    maxLines: widget.maxLines,
                    textAlign: widget.textAlign,
                    onChanged: widget.onChange,
                    validator: (value) {
                      if (widget.validator == null) return null;
                      validateField(value);
                      return widget.validator!(value);
                    },
                    inputFormatters: widget.inputFormatters,

                    decoration: InputDecoration(
                     fillColor: widget.readOnly ? Colors.grey :  Colors.red,
                      hintText: widget.withLabel ? null : widget.hintText,
                      floatingLabelBehavior: FloatingLabelBehavior.never,

                      label: widget.withLabel
                          ? Text(
                              widget.hintText!,
                              style: getBoldStyle(
                                color: Colors.black,
                              ),
                            )
                          : null,
                      suffixIcon: widget.suffixIcon,
                      contentPadding: widget.contentPadding,
                      labelStyle: getRegularStyle(color: Colors.white),
                      hintStyle: getBoldStyle(
                        color: ColorManager.lightGray,
                        fontSize: 12
                      ),
                      errorStyle: const TextStyle(
                        fontSize: 0,
                        height: 0.1,
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
            padding: const EdgeInsets.only(top: 6.0, right: 18, left: 18),
            child: Text(
              widget.errorMessage ?? validationErrorMessage ?? '',
              style: getBoldStyle(
                color: Colors.red,
                fontSize: FontSizeApp.s12,
              )!
                  .copyWith(height: 1),
            ),
          ),
      ],
    );
  }
}
