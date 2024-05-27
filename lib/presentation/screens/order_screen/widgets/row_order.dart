import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class RowOrder extends StatelessWidget {
  const RowOrder({super.key, required this.title, required this.details});

  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    if (details == '') return const SizedBox();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getBoldStyle(
            color: Colors.black,
            fontSize: 11.sp,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            ": ",
            style: getBoldStyle(
              color: Colors.black,
              fontSize: 11.sp,
            ),
          ),
        ),
        Expanded(
          child: Text(
            details,
            style: getRegularStyle(
              color: ColorManager.grayForMessage,
              fontSize: 11.sp,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
