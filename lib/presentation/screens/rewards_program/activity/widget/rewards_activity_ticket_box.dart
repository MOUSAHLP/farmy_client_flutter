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
      clipBehavior: Clip.hardEdge,
      width: double.minPositive,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: -17,
            blurRadius: 15,
            offset: const Offset(0, -10), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: -17,
            blurRadius: 15,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          (MediaQuery.of(context).size.width * 0.43478260869565216).toDouble(),
        ),
        painter: RPSCustomPainter(),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: PaddingApp.p8),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    PaddingApp.p10,
                    PaddingApp.p5,
                    PaddingApp.p5,
                    PaddingApp.p5,
                  ),
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
                            style:
                                getBoldStyle(color: ColorManager.primaryGreen),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(
                            start: PaddingApp.p5),
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
        ),
      ),
    );

    // return Container(
    //   alignment: Alignment.center,
    //   padding: const EdgeInsets.symmetric(
    //       horizontal: PaddingApp.p20, vertical: PaddingApp.p5),
    //   decoration: BoxDecoration(
    //     color: ColorManager.white,
    //     boxShadow: [ColorManager.shadowGaryDownSoft],
    //     borderRadius: BorderRadius.circular(RadiusApp.r12),
    //     image: const DecorationImage(
    //       image: AssetImage(
    //         ImageManager.ticket,
    //       ),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: IntrinsicHeight(
    //     child: Row(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsetsDirectional.fromSTEB(
    //               PaddingApp.p10, PaddingApp.p5, PaddingApp.p5, PaddingApp.p5),
    //           child: Row(
    //             children: [
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Image.asset(
    //                     ImageManager.discount,
    //                     width: 80.w,
    //                     height: 80.h,
    //                   ),
    //                   Text(
    //                     imageText,
    //                     style: getBoldStyle(color: ColorManager.primaryGreen),
    //                   )
    //                 ],
    //               ),
    //               Container(
    //                 margin:
    //                     const EdgeInsetsDirectional.only(start: PaddingApp.p5),
    //                 decoration: DottedDecoration(
    //                     color: ColorManager.grayForMessage,
    //                     strokeWidth: 0.5,
    //                     linePosition: LinePosition.right,
    //                     dash: const [3, 3]),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Expanded(
    //             child: Padding(
    //           padding: const EdgeInsets.symmetric(
    //               vertical: PaddingApp.p8, horizontal: PaddingApp.p10),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 text,
    //                 style: getBoldStyle(
    //                   color: ColorManager.grayForMessage,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 8.h,
    //               ),
    //               child
    //             ],
    //           ),
    //         ))
    //       ],
    //     ),
    //   ),
    // );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.01086957, size.height * 0.05000000);
    path_0.cubicTo(
        size.width * 0.01086957,
        size.height * 0.02928937,
        size.width * 0.01816927,
        size.height * 0.01250000,
        size.width * 0.02717391,
        size.height * 0.01250000);
    path_0.lineTo(size.width * 0.9728261, size.height * 0.01250000);
    path_0.cubicTo(
        size.width * 0.9818315,
        size.height * 0.01250000,
        size.width * 0.9891304,
        size.height * 0.02928931,
        size.width * 0.9891304,
        size.height * 0.05000000);
    path_0.lineTo(size.width * 0.9891304, size.height * 0.3563737);
    path_0.cubicTo(
        size.width * 0.9643234,
        size.height * 0.3687712,
        size.width * 0.9456522,
        size.height * 0.4227675,
        size.width * 0.9456522,
        size.height * 0.4875000);
    path_0.cubicTo(
        size.width * 0.9456522,
        size.height * 0.5522325,
        size.width * 0.9643234,
        size.height * 0.6062287,
        size.width * 0.9891304,
        size.height * 0.6186262);
    path_0.lineTo(size.width * 0.9891304, size.height * 0.9250000);
    path_0.cubicTo(
        size.width * 0.9891304,
        size.height * 0.9457125,
        size.width * 0.9818315,
        size.height * 0.9625000,
        size.width * 0.9728261,
        size.height * 0.9625000);
    path_0.lineTo(size.width * 0.02717389, size.height * 0.9625000);
    path_0.cubicTo(
        size.width * 0.01816927,
        size.height * 0.9625000,
        size.width * 0.01086957,
        size.height * 0.9457125,
        size.width * 0.01086957,
        size.height * 0.9250000);
    path_0.lineTo(size.width * 0.01086957, size.height * 0.6186262);
    path_0.cubicTo(
        size.width * 0.03567663,
        size.height * 0.6062287,
        size.width * 0.05434783,
        size.height * 0.5522325,
        size.width * 0.05434783,
        size.height * 0.4875000);
    path_0.cubicTo(
        size.width * 0.05434783,
        size.height * 0.4227675,
        size.width * 0.03567663,
        size.height * 0.3687712,
        size.width * 0.01086957,
        size.height * 0.3563737);
    path_0.lineTo(size.width * 0.01086957, size.height * 0.05000000);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
