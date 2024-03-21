import 'package:flutter/material.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_box.dart';
import 'package:pharma/presentation/screens/rewards_program/activity/widget/rewards_activity_ticket_content.dart';

class RewardsActivityTicketOffers extends StatelessWidget {
  final String text;
  final String code;
  final String codeValidity;
  final String imageText;
  // not used yet -- need to use NetworkImage to use this field
  final String imagePath;

  const RewardsActivityTicketOffers({
    super.key,
    required this.text,
    required this.code,
    required this.codeValidity,
    required this.imageText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => RewardsActivityTicketBox(
        text: text,
        imageText: imageText,
        imagePath: imagePath,
        child: RewardsActivityTicketContent(
          code: code,
          codeValidity: codeValidity,
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 100,
      ),
      itemCount: 1,
    );
  }
}
