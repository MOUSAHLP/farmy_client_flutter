import 'package:flutter/material.dart';
import 'package:pharma/presentation/resources/color_manager.dart';

import 'package:pharma/presentation/screens/join_our_team/widgets/custom_job_row.dart';

class CustomSelectJobDialog extends StatelessWidget {
  const CustomSelectJobDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: ColorManager.white,
          ),
          width: 280,
          height: 415,
          child: const Column(
            children: [
              Column(
                children: [
                  CustomJobRow(),
                  CustomJobRow(),
                  CustomJobRow(),
                  CustomJobRow(),
                  CustomJobRow()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
