import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/screens/auth_screen/%20widgets/input_field_auth.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 158,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            ColorManager.lightGray,
            ColorManager.primaryGreen,
            ColorManager.darkGreen
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ImageManager.menuImage,
                        height: 21,
                        width: 21,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Image.asset(
                          ImageManager.notificationImage,
                          height: 17,
                          width: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "فارمي",
                        style: getBoldStyle(
                            color: Colors.white, fontSize: FontSizeApp.s24),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      SvgPicture.asset(
                        IconsManager.logoApp,
                        height: 31,
                        width: 31,
                      ),
                    ],
                  ),
                  Image.asset(
                    ImageManager.contactUs,
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ),
            InputFieldAuth(
              maxLines: 2,
              textStyle: getBoldStyle(color: ColorManager.grayForSearchProduct),
              hintText: "البحث عن منتجات",
              hintStyle: getBoldStyle(
                  color: ColorManager.grayForSearchProduct,
                  fontSize: FontSizeApp.s14),
              prefixIcon: const Icon(Icons.search),
              height: 44,
              width: 1.sw - 25,
              color: ColorManager.grayForSearch,
              borderColor:ColorManager.grayForSearchProduct ,
            )
          ],
        ),
      ),
    );
  }
}
