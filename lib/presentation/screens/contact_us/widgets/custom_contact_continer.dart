import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomContactContoner extends StatelessWidget {
  final String contactImage;
  const CustomContactContoner({super.key, required this.contactImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 30,
          width: 146,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                    color: ColorManager.black.withOpacity(0.18))
              ],
              borderRadius: const BorderRadius.all(Radius.circular(37)),
              color: ColorManager.white),
          child: Center(
              child: Text("0936252114",
                  maxLines: 2,
                  style: getBoldStyle(color: ColorManager.grayForMessage)!
                      .copyWith(overflow: TextOverflow.ellipsis))),
        ),
        Container(
          height: 31,
          width: 31,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.primaryGreen,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(contactImage),
          ),
        ),
      ],
    );
  }
}
