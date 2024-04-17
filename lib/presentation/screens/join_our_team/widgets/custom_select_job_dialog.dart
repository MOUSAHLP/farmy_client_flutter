import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';

import 'package:pharma/presentation/screens/join_our_team/widgets/custom_job_row.dart';

class CustomSelectJobDialog extends StatelessWidget {
  const CustomSelectJobDialog(
      {super.key, required this.jobs, required this.onChanged});

  final List<String> jobs;
  final Function(String?) onChanged;

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
          // height: 415,
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: ColorManager.grayForSearch,
            ),
            padding: EdgeInsetsDirectional.symmetric(
              vertical: 17.h,
            ),
            itemCount: jobs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                onChanged(jobs[index]);
              },
              child: Text(
                textAlign: TextAlign.center,
                jobs[index],
                style: getUnderBoldStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s18.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
