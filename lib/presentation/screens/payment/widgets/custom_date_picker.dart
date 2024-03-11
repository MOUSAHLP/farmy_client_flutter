import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        AppLocalizations.of(context)!.select_calculator,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w900,
          color: const Color(0XFF727272),
          fontFamily: "FrutigerLTArabic",
        ),
      ),
      content: SizedBox(
        height: 270.h,
        width: 349.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            offset: const Offset(-2, -2),
                            spreadRadius: 0,
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.0.r),
                      ),
                      width: 70.w,
                      height: 41.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.today,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF727272),
                              fontFamily: "FrutigerLTArabic",
                            ),
                          ),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          InkWell(
                            onTap: () {
                              print('اليوم');

                            },
                            child: SvgPicture.asset(ImageManager.dropDown),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(-2, -2),
                        spreadRadius: 0,
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0.r),
                  ),
                  width: 80.w,
                  height: 41.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.month,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF727272),
                          fontFamily: "FrutigerLTArabic",
                        ),
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      SvgPicture.asset(ImageManager.dropDown),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(-2, -2),
                        spreadRadius: 0,
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0.r),
                  ),
                  width: 70.w,
                  height: 41.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.year,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF727272),
                          fontFamily: "FrutigerLTArabic",
                        ),
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      SvgPicture.asset(ImageManager.dropDown),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 33.h),
            Text(
              AppLocalizations.of(context)!.select_hour,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w900,
                color: const Color(0XFF727272),
                fontFamily: "FrutigerLTArabic",
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(-2, -2),
                        spreadRadius: 0,
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0.r),
                  ),
                  width: 85.w,
                  height: 41.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.hour,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF727272),
                          fontFamily: "FrutigerLTArabic",
                        ),
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      SvgPicture.asset(ImageManager.dropDown),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Text(
                    ":",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0XFF727272),
                      fontFamily: "FrutigerLTArabic",
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(-2, -2),
                        spreadRadius: 0,
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0.r),
                  ),
                  width: 85.w,
                  height: 41.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.minutes,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF727272),
                          fontFamily: "FrutigerLTArabic",
                        ),
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      SvgPicture.asset(ImageManager.dropDown),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 42.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  label: AppLocalizations.of(context)!.back,
                  width: 97.w,
                ),
                SizedBox(width: 30.w),
                CustomButton(
                  label: AppLocalizations.of(context)!.confirm,
                  width: 97.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
