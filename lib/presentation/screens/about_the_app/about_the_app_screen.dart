import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/custom_app_bar_screen.dart';

class AboutTheApp extends StatelessWidget {
  const AboutTheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const CustomAppBarScreen(sectionName: "حول التطبيق"),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 74),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 139,
                        width: 139,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorManager.primaryGreen,
                                  ColorManager.softGreen
                                ])),
                        child: Image.asset(ImageManager.logoAboutApp)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 244,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "تطبيق فارمي ",
                            style: getBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15),
                          ),
                          Text(
                            "Android V1.1.2 ",
                            style: getBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15),
                          ),
                        ],
                      ),
                      Text(
                        "جميع الحقوق محفوظة لشركة فارمي (farmy)ⓒ",
                        style: getBoldStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s14),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
