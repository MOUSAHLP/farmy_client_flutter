import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class PointsExpireInWidget extends StatelessWidget {
  final String expireInText;
  const PointsExpireInWidget({super.key, required this.expireInText});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        "تنتهي صلاحية النقاط خلال $expireInText",
        style: getRegularStyle(
          color: ColorManager.grayForMessage,
        ),
      ),
    );
  }
}
