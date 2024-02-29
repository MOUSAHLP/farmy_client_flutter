import 'package:flutter/material.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_box.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_buy_content.dart';

class RewardsActivityTicketBuy extends StatelessWidget {
  final String text;
  final String point;
  final String imageText;
  final String
      imagePath; // not used yet -- need to use NetworkImage to use this field
  const RewardsActivityTicketBuy(
      {Key? key,
      required this.text,
      required this.point,
      required this.imageText,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RewardsActivityTicketBox(
      text: text,
      imageText: imageText,
      imagePath: imagePath,
      child: RewardsActivityTicketBuyContent(
        point: point,
      ),
    );
  }
}
