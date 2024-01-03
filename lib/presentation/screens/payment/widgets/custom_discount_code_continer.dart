import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomDiscountCodeContiner extends StatelessWidget {
  final String subjectText;
  final String imageUrl;
  final bool? isReplacePoint;
  const CustomDiscountCodeContiner(
      {super.key,
      required this.subjectText,
      required this.imageUrl,
      this.isReplacePoint = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorManager.grayForMessage,
            width: 1,
          )),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Image.asset(
            imageUrl,
            height: 39,
            width: 39,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              subjectText,
              style: getBoldStyle(
                      color: ColorManager.grayForMessage,
                      fontSize: FontSizeApp.s10)!
                  .copyWith(height: 1),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          isReplacePoint == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                  ),
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primaryGreen,
                          borderRadius: BorderRadius.circular(4)),
                      height: 22,
                      width: 22,
                      child: Image.asset(ImageManager.listOfTypeJoinUs),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}
