import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomBillDetailsRow extends StatelessWidget {
  final String subStatusBill;
  final String price;
  final Color? colorText;
  const CustomBillDetailsRow(
      {super.key,
      required this.price,
      required this.subStatusBill,
      this.colorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subStatusBill,
                style: getRegularStyle(
                    color: colorText ?? ColorManager.grayForMessage,
                    fontSize: FontSizeApp.s16),
              ),
              Text(
                price.toString(),
                style: getUnderBoldStyle(
                    color: colorText ?? ColorManager.grayForMessage,
                    fontSize: FontSizeApp.s14),
              )
            ],
          ),
          SizedBox(
            width: 1.sw,
            child:  Divider(
              thickness: 1,
              height: 7.h,
              indent: 2,
              color: ColorManager.lightGray,
            ),
          ),
        ],
      ),
    );
  }
}
