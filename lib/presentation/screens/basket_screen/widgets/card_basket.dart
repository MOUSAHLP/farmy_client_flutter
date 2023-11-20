import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/cached_image.dart';

class CardBasket extends StatelessWidget {
  const CardBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 37),
      child: Container(
        height: 115,
        width: 1.sw,
        decoration: BoxDecoration(boxShadow: [
         ColorManager.shadowGaryDown
        ], color: Colors.white, borderRadius: BorderRadius.circular(6)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(boxShadow: [
                      ColorManager.shadowGaryDown,
                    ], color: Colors.white),
                    child: const Icon(Icons.add,
                        color: ColorManager.primaryGreen),
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(boxShadow: [
                      ColorManager.shadowGaryDown,
                    ], color: Colors.white),
                    child:
                    const Icon(Icons.remove, color: Colors.red),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "فليفلة حمراء",
                  style: getMoreBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSizeApp.s10)
                      ?.copyWith(height: 1),
                ),
                Padding(
                  padding:  const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "400 غ",
                        style: getRegularStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s13)!
                            .copyWith(height: 1),
                      ),
                      Text(
                        " / ",
                        style: getRegularStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s13)!
                            .copyWith(height: 1),
                      ),
                      Text(
                        "15 قطعة",
                        style: getRegularStyle(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s10)!
                            .copyWith(height: 1),
                      ),
                    ],
                  ),
                ),
                Text(" 50.000 sy",
                    style: getBoldStyle(
                        color: ColorManager.primaryGreen,
                        fontSize: FontSizeApp.s12)!
                        .copyWith(
                        height: 1)),
              ],
            ),
            const SizedBox(
              width: 19,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 115,
                color: ColorManager.grayForPlaceholde,
                child: const CachedImage(
                  imageUrl: "",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
