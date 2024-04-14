import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFieldAuth extends StatefulWidget {
  const InputFieldAuth({
    this.fillColor,
    this.prefixIcon,
    this.angelRadios,
    this.hintStyle,
    this.fillIconColor = ColorManager.primaryGreen,
    this.hintText,
    this.keyboardType,
    this.textStyle = const TextStyle(color: ColorManager.primaryGreen),
    this.suffixIcon,
    this.width,
    Key? key,
    this.controller,
    this.borderColor,
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
    this.color,
    this.withLabel = false,
    this.inputFormatters,
    this.icon,
    this.validator,
    this.isPhone = false,
  }) : super(key: key);

  final String? hintText;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Color? fillIconColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool readOnly;
  final TextAlign textAlign;
  final void Function()? onTab;
  final String? errorMessage;
  final Function(String value)? onChange;
  final Radius? angelRadios;
  final int? minLines;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final double? height;
  final double? width;
  final String? initValue;
  final bool withLabel;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? icon;
  final Color? color;
  final String? Function(String?)? validator;
  final bool isPhone;

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
          alignment: Alignment.center,
          height: widget.height,
          width: (widget.width ?? 1.sw - 100).clamp(
            0.0,
            double.infinity,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.borderColor ?? Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadiusDirectional.all(
              widget.angelRadios ?? const Radius.circular(12),
            ),
            color: widget.color ?? Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 40.h,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
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
                      validator: (value) {
                        if (widget.validator == null) return null;
                        validateField(value);
                        return widget.validator!(value);
                      },
                      inputFormatters: widget.inputFormatters,
                      decoration: InputDecoration(
                        fillColor: widget.readOnly ? Colors.grey : Colors.red,
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
                        prefixIcon: widget.isPhone
                            ? SizedBox(
                                width:0.0.w,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(top: 0.h),
                                    child: Text(
                                      "+963 ",
                                      style: getBoldStyle(
                                        color:
                                            ColorManager.grayForSearchProduct,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : widget.prefixIcon,
                        suffixIcon: widget.suffixIcon,
                        contentPadding: widget.contentPadding,
                        labelStyle: getRegularStyle(color: Colors.white),
                        hintStyle: widget.hintStyle ??
                            getBoldStyle(
                              height: 2.4.h,
                              color: ColorManager.grayForSearchProduct,
                              fontSize: 12.0.sp,
                            ),
                        errorStyle: const TextStyle(
                          fontSize: 0,
                          height: 0.1,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(28.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(28.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(28.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                ),
                child: widget.icon,
              ),
            ],
          ),
        ),
        if (widget.errorMessage != null || validationErrorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 6.0, right: 18, left: 18),
            child: Text(
              widget.errorMessage ?? validationErrorMessage ?? '',
              style: getBoldStyle(
                color: ColorManager.redForFavorite,
                fontSize: FontSizeApp.s12.sp,
              )!
                  .copyWith(height: 1),
            ),
          ),
      ],
    );
  }
}
