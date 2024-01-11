import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomAppBarScreen extends StatelessWidget {
  final String sectionName;
  final bool isComeBack;
  const CustomAppBarScreen(
      {super.key, required this.sectionName,  this.isComeBack=true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 47,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.18),
            offset: const Offset(0, 2),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionName,
              style: getBoldStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s15),
            ),
            isComeBack == false
                ? const SizedBox()
                : InkWell(
                    onTap: () {
                      AppRouter.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: ColorManager.grayForMessage,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
