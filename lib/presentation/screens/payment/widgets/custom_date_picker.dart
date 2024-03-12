import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  List<String> listDay = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
  ];
  List<String> listMonth = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  List<String> listMinutes = [
    "5",
    "10",
    "15",
    "20",
    "25",
    "30",
    "35",
    "40",
    "45",
    "50",
    "55",
  ];
  List<String> listHours = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
  ];
  String? day;
  String? month;
  String? hour;
  String? minutes;
  bool isExpandedDay = false;
  bool isExpandedMonth = false;
  bool isExpandedHours = false;
  bool isExpandedMinutes = false;

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
        width: 349.w,
        height: 270.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: AnimatedCrossFade(
                    secondCurve: Curves.linear,
                    duration: const Duration(milliseconds: 200),
                    firstChild: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          isExpandedDay = !isExpandedDay;
                        });
                      },
                      child: SizedBox(
                        width: 70.w,
                        height: 41.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              day == null
                                  ? AppLocalizations.of(context)!.today
                                  : day!,
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
                    ),
                    secondChild: Center(
                      child: SizedBox(
                        height: 90.h,
                        width: 60.w,
                        child: ListView.separated(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    isExpandedDay = !isExpandedDay;
                                  });
                                  day = listDay[index];
                                },
                                child: Text(
                                  textAlign: TextAlign.center,
                                  listDay[index],
                                  style: getBoldStyle(
                                    color: ColorManager.primaryGreen,
                                    fontSize: FontSizeApp.s12,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          itemCount: listDay.length,
                        ),
                      ),
                    ),
                    crossFadeState: isExpandedDay
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
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
                  width: 80.w,
                  height: 41.h,
                  child: AnimatedCrossFade(
                    secondCurve: Curves.linear,
                    duration: const Duration(milliseconds: 200),
                    firstChild: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          isExpandedMonth = !isExpandedMonth;
                        });
                      },
                      child: Center(
                        child: SizedBox(
                          width: 70.w,
                          height: 41.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                month == null
                                    ? AppLocalizations.of(context)!.month
                                    : month!,
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
                      ),
                    ),
                    secondChild: Center(
                      child: SizedBox(
                        height: 90.h,
                        width: 60.w,
                        child: ListView.separated(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    isExpandedMonth = !isExpandedMonth;
                                  });
                                  month = listMonth[index];
                                },
                                child: Text(
                                  textAlign: TextAlign.center,
                                  listDay[index],
                                  style: getBoldStyle(
                                    color: ColorManager.primaryGreen,
                                    fontSize: FontSizeApp.s12,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          itemCount: listMonth.length,
                        ),
                      ),
                    ),
                    crossFadeState: isExpandedMonth
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
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
                        "2023",
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
                  width: 80.w,
                  height: 41.h,
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 200),
                    firstChild: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          isExpandedMinutes = !isExpandedMinutes;
                        });
                      },
                      child: SizedBox(
                        width: 80.w,
                        height: 41.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              minutes == null
                                  ? AppLocalizations.of(context)!.minutes
                                  : minutes!,
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
                    ),
                    secondChild: Center(
                      child: SizedBox(
                        height: 90.h,
                        width: 70.w,
                        child: ListView.separated(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    isExpandedMinutes = !isExpandedMinutes;
                                  });
                                  minutes = listMinutes[index];
                                },
                                child: Text(
                                  textAlign: TextAlign.center,
                                  listMinutes[index],
                                  style: getBoldStyle(
                                    color: ColorManager.primaryGreen,
                                    fontSize: FontSizeApp.s12,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          itemCount: listMinutes.length,
                        ),
                      ),
                    ),
                    crossFadeState: isExpandedMinutes
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
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
                  width: 80.w,
                  height: 41.h,
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 200),
                    firstChild: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          isExpandedHours = !isExpandedHours;
                        });
                      },
                      child: SizedBox(
                        width: 80.w,
                        height: 41.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              hour == null
                                  ? AppLocalizations.of(context)!.hour
                                  : hour!,
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
                    ),
                    secondChild: Center(
                      child: SizedBox(
                        height: 90.h,
                        width: 60.w,
                        child: ListView.separated(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    isExpandedHours = !isExpandedHours;
                                  });
                                  hour = listHours[index];
                                },
                                child: Text(
                                  textAlign: TextAlign.center,
                                  listHours[index],
                                  style: getBoldStyle(
                                    color: ColorManager.primaryGreen,
                                    fontSize: FontSizeApp.s12,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          itemCount: listHours.length,
                        ),
                      ),
                    ),
                    crossFadeState: isExpandedHours
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
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
