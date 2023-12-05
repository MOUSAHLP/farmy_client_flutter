import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/translations.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            left: BorderSide(color: ColorManager.grayForMessage),
            right: BorderSide(color: ColorManager.grayForMessage),
            top: BorderSide(
                color: ColorManager.grayForMessage), // White border at the top
            bottom: BorderSide(
                color:
                    ColorManager.grayForMessage), // White border at the bottom
          )),
      width: 1.sw,
      height: 61,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageManager.location,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                     AppLocalizations.of(context)!.delivery_to,
                        style: getSemiBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s10)!
                            .copyWith(height: 1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "دمشق - الميدان - بناء الادخار ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                                  fontSize: FontSizeApp.s13,
                                  color: ColorManager.primaryGreen)!
                              .copyWith(height: 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              ImageManager.goForAllAdress,
              height: 13,
              width: 13,
              color: ColorManager.grayForMessage,
            )
          ],
        ),
      ),
    );
  }
}
