import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CardMyAccount extends StatelessWidget {
  const CardMyAccount({
    super.key,
    required this.title,
    required this.details,
    required this.onTap,
  });

  final String title;
  final String details;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: getBoldStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        details,
                        style: getBoldStyle(
                          color: ColorManager.grayForMessage,
                          fontSize: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 15.h,
                    color: ColorManager.grayForMessage,
                  ),
                )
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
