import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/color_manager.dart';

class CustomRating extends StatelessWidget {
  final double rate;
  final double itemSize;
  final bool readOnly;
  final EdgeInsetsDirectional? padding;
  final Function? onRatingUpdate;
  final IconData? icon;

  const CustomRating(
      {required this.rate,
      required this.itemSize,
      this.readOnly = false,
      this.icon,
      Key? key,
      this.padding,
      this.onRatingUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: RatingBar.builder(
        unratedColor: ColorManager.grayForSearch,
        initialRating: rate,
        minRating: 1,
        itemSize: itemSize,
        ignoreGestures: readOnly,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemPadding:
            padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        itemBuilder: (context, _) => Icon(
          icon ?? Icons.star,
          color: ColorManager.yellow,
        ),
        onRatingUpdate: onRatingUpdate != null
            ? (rating) {
                onRatingUpdate!(rating);
                print(rating);
              }
            : (rating) {},
      ),
    );
  }
}
