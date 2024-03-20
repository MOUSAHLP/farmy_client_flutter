import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class OrderStatusContainer extends StatelessWidget {
  final String text;
  final String image;
  final bool isActive;
  const OrderStatusContainer(
      {Key? key,
      required this.text,
      required this.image,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.all(
            9.0,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? ColorManager.primaryGreen
                : ColorManager.grayForMessage,
            shape: BoxShape.circle,
          ),
          height: 100,
          width: 100,
          child: Container(
            decoration: const BoxDecoration(
              color: ColorManager.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                image,
                color: isActive
                    ? ColorManager.primaryGreen
                    : ColorManager.grayForMessage,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            text,
            style: getBoldStyle(
              color: isActive
                  ? ColorManager.primaryGreen
                  : ColorManager.grayForMessage,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
