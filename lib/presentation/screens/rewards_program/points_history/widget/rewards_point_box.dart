import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/values_app.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/widget/rewards_point_point.dart';
import 'package:pharma/presentation/screens/rewards_program/points_history/widget/rewards_point_row.dart';
import 'package:pharma/translations.dart';

class RewardsPointBox extends StatelessWidget {
  final String point;
  final String date;
  final String? expiredDate;
  const RewardsPointBox(
      {super.key, required this.point, required this.date, this.expiredDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p16, vertical: PaddingApp.p8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusApp.r5),
        color: Colors.white,
        boxShadow: [
          ColorManager.shadowGaryDown,
        ],
      ),
      child: Row(
        children: [
          RewardsPointPoint(point: point, expired: expiredDate != null),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p8),
              child: Column(
                children: [
                  RewardsPointRow(
                    text: AppLocalizations.of(context)!.date_of_use,
                    date: date,
                  ),
                  if (expiredDate != null)
                    RewardsPointRow(
                      text: AppLocalizations.of(context)!.expiry_date,
                      date: expiredDate!,
                      expired: true,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
