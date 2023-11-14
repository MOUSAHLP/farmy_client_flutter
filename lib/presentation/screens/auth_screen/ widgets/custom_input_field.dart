import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma/presentation/resources/color_manager.dart';

import '../../../resources/style_app.dart';


class CustomInputField extends StatefulWidget {
  const CustomInputField(
      {this.fillColor,
      this.hintText,
      this.keyboardType,
      this.textStyle,
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
      this.height = 50,
      this.initValue,
      this.withLabel = false,
      this.inputFormatters,
      this.icon,
      this.validator})
      : super(key: key);

  final String? hintText;
  final TextInputType? keyboardType;
  final Color? fillColor;
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
  final IconData? icon;
  final String? Function(String?)? validator;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 311,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: widget.readOnly ? const Color(0xFFEEF6F6) : widget.fillColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              children: [
                if (widget.icon != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      widget.icon,
                      color: ColorManager.primaryGreen,
                    ),
                  ),
                Expanded(
                  child: TextFormField(
                    initialValue: widget.initValue,
                    keyboardType: widget.keyboardType,
                    onTap: widget.onTab,
                    style: widget.textStyle,
                    controller: widget.controller,
                    readOnly: widget.readOnly,
                    minLines: widget.minLines,
                    maxLines: widget.maxLines,
                    textAlign: widget.textAlign,
                    onChanged: widget.onChange,
                    validator: widget.validator,
                    inputFormatters: widget.inputFormatters,
                    decoration: InputDecoration(
                      fillColor:
                          widget.readOnly ? Colors.grey : const Color(0xFFEEF6F6),
                      hintText: widget.withLabel ? null : widget.hintText,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: widget.withLabel
                          ? Text(
                              widget.hintText!,
                              style: getBoldStyle(
                                color: ColorManager.primaryGreen,
                              ),
                            )
                          : null,
                      suffixIcon: widget.suffixIcon,
                      contentPadding: widget.contentPadding,
                      hintStyle: getBoldStyle(
                        color: Colors.grey,
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
        if (widget.errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 18, left: 18),
            child: Text(
              widget.errorMessage ?? '',
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
