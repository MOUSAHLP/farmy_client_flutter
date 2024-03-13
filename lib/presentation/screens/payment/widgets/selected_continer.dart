import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';

// ignore: must_be_immutable
class SelectedContainer extends StatelessWidget {
  Color color;
  bool? isSelected;
  Function()? onPressed;
  int? idMethodeType;

  SelectedContainer({
    super.key,
    this.onPressed,
    required this.color,
    this.isSelected,
     this.idMethodeType,
  });

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 10,
          offset: const Offset(2, 5),
        ),
      ],
      child: idMethodeType == 3
          ? SvgPicture.asset(ImageManager.arrowBack,color: color,)
          : Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
    );
  }
}
