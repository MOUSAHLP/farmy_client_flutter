import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

// ignore: must_be_immutable
class SlectedContiner extends StatelessWidget {
  Color color;
  bool? isSlected;

  Function() onPreased;

  SlectedContiner(
      {super.key,
      required this.onPreased,
      required this.color,
      this.isSlected});

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: [
        BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(2, 5)),
      ],
      child: GestureDetector(
        onTap: onPreased,
        child: Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
