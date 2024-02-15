import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/values_app.dart';

class RewardsFilterRow extends StatelessWidget {
  final List<Widget> rewardsFilterBoxArray;
  const RewardsFilterRow({super.key, required this.rewardsFilterBoxArray});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingApp.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ...List.generate(rewardsFilterBoxArray.length, (int index) {
            return rewardsFilterBoxArray[index];
          }),
        ],
      ),
    );
  }
}
