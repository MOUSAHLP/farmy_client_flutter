import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

class RewardsActivityTicketBox extends StatelessWidget {
  final String text;
  final String imageText;
  final String
      imagePath; // not used yet -- need to use NetworkImage to use this field
  final Widget child;
  const RewardsActivityTicketBox(
      {Key? key,
      required this.text,
      required this.imageText,
      required this.imagePath,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p20, vertical: PaddingApp.p5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        boxShadow: [ColorManager.shadowGaryDownSoft],
        borderRadius: BorderRadius.circular(RadiusApp.r12),
        image: const DecorationImage(
          image: AssetImage(
            ImageManager.ticket,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  PaddingApp.p10, PaddingApp.p5, PaddingApp.p5, PaddingApp.p5),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageManager.discount,
                        width: 80.w,
                        height: 80.h,
                      ),
                      Text(
                        imageText,
                        style: getBoldStyle(color: ColorManager.primaryGreen),
                      )
                    ],
                  ),
                  Container(
                    margin:
                        const EdgeInsetsDirectional.only(start: PaddingApp.p5),
                    decoration: DottedDecoration(
                        color: ColorManager.grayForMessage,
                        strokeWidth: 0.5,
                        linePosition: LinePosition.right,
                        dash: const [3, 3]),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: PaddingApp.p8, horizontal: PaddingApp.p10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
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
            ))
          ],
        ),
      ),
    );
    ;
  }
}
