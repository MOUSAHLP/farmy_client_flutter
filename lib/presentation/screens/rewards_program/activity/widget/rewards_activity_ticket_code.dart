import 'package:flutter/material.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_box.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_content.dart';

class RewardsActivityTicketCode extends StatelessWidget {
  final String text;
  final String code;
  final String codeValidity;
  final String imageText;
  final String
      imagePath; // not used yet -- need to use NetworkImage to use this field
  const RewardsActivityTicketCode(
      {super.key,
      required this.text,
      required this.code,
      required this.codeValidity,
      required this.imageText,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return RewardsActivityTicketBox(
      text: text,
      imageText: imageText,
      imagePath: imagePath,
      child: RewardsActivityTicketContent(
        code: code,
        codeValidity: codeValidity,
      ),
    );
  }
}
