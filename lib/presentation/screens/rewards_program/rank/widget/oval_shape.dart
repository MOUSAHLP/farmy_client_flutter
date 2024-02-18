import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';

class OvalShape extends StatelessWidget {
  final Widget? child;
  final Color? color;
  const OvalShape({super.key, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.transparent,
      child: CustomPaint(
        painter: CurvePainter(),
        child: child,
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = ColorManager.primaryGreen;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 2, size.height * 1.6, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
