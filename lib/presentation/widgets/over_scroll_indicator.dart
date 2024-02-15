import 'package:flutter/material.dart';

class CustomOverscrollIndicator extends StatelessWidget {
  const CustomOverscrollIndicator({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (over) {
          over.disallowIndicator();
          return true;
        },
        child: child);
  }
}
