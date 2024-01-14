import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/style_app.dart';

class RowOrder extends StatelessWidget {
  const RowOrder({super.key, required this.title, required this.details});
  final String title;
  final String details;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: getUnderBoldStyle(color: Colors.black, fontSize: 11)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(":",
              style: getUnderBoldStyle(color: Colors.black, fontSize: 11)),
        ),
        Expanded(
            child: Text(details,
                style: getRegularStyle(
                    color: ColorManager.grayForMessage, fontSize: 11),
                maxLines: 2,
                overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
