import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class CustomContactContainer extends StatelessWidget {
  final String contactImage;

  const CustomContactContainer({super.key, required this.contactImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 30,
          width: 140,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                    color: ColorManager.black.withOpacity(0.18))
              ],
              borderRadius: const BorderRadius.all(Radius.circular(37)),
              color: ColorManager.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "0936252114",
                  maxLines: 2,
                  style: getBoldStyle(color: ColorManager.grayForMessage)!
                      .copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
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
