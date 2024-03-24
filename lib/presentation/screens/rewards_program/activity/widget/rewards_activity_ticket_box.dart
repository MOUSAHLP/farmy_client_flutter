import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

// not used yet -- need to use NetworkImage to use this field
class RewardsActivityTicketBox extends StatelessWidget {
  final String text;
  final String imageText;
  final String imagePath;
  final Widget child;

  const RewardsActivityTicketBox({
    Key? key,
    required this.text,
    required this.imageText,
    required this.imagePath,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImageManager.subtract,
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 22.w, end: 9.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      imagePath,
                      colorFilter: const ColorFilter.mode(
                       ColorManager.grayForMessage,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      imageText,
                      style: getBoldStyle(color: ColorManager.primaryGreen),
                    ),
                  ],
                ),
              ),
              Container(
                height: 137.0.h,
                decoration: DottedDecoration(
                  color: ColorManager.grayForMessage,
                  strokeWidth: 0.5,
                  linePosition: LinePosition.right,
                  dash: const [3, 3],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: PaddingApp.p8.h,
                    horizontal: PaddingApp.p10.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                          color: ColorManager.grayForMessage,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      child
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
