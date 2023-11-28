import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomOrderScheduling extends StatelessWidget {
  final String deliverycost;
  final String image;
  const CustomOrderScheduling(
      {super.key, required this.deliverycost, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 1.sw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: ColorManager.grayForMessage,
                  width: 1,
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 19),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          image,
                          height: 34,
                          width: 34,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Text(
                        "asd",
                        style: getMoreBoldStyle(
                            color: ColorManager.grayForMessage),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: ColorManager.grayForMessage,
                    )
                  ]),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          deliverycost,
          style: getMoreBoldStyle(
              color: ColorManager.grayForMessage, fontSize: FontSizeApp.s14),
        ),
      ],
    );
  }
}
