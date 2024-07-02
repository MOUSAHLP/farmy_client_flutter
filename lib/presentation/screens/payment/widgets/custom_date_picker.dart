import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma/bloc/payment_bloc/payment_bloc.dart';
import 'package:pharma/core/app_router/app_router.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';
import 'package:pharma/presentation/resources/color_manager.dart';
import 'package:pharma/presentation/resources/font_app.dart';
import 'package:pharma/presentation/resources/style_app.dart';
import 'package:pharma/presentation/widgets/custom_button.dart';
import 'package:pharma/translations.dart';

class CustomDatePicker extends StatelessWidget {
  final List<String> listMinutes = [
    "05",
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

  final List<String> listHours = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
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
  String? hour;
  String? minutes;
  final PaymentBloc paymentBloc;

  CustomDatePicker({super.key, required this.paymentBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: paymentBloc,
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 220.h,
            width: 349.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                            paymentBloc.add(SelectedHoursEvents(
                                (state as PaymentState).isExpandedHours));
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
                                      paymentBloc.add(SelectedHoursEvents(
                                          (state as PaymentState)
                                              .isExpandedHours));

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
                        crossFadeState: (state as PaymentState).isExpandedHours
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
                            paymentBloc.add(
                                SelectedMinutesEvents(state.isExpandedMinutes));
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
                                      paymentBloc.add(SelectedMinutesEvents(
                                          state.isExpandedMinutes));
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
                        crossFadeState: state.isExpandedMinutes
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
                      onTap: () => AppRouter.pop(context),
                      label: AppLocalizations.of(context)!.back,
                      width: 97.w,
                    ),
                    SizedBox(width: 30.w),
                    CustomButton(
                      onTap: () {
                        print("$hour:$minutes");
                        paymentBloc.add(GetTimeEvent(time: "$hour:$minutes"));
                        AppRouter.pop(context);
                      },
                      label: AppLocalizations.of(context)!.confirm,
                      width: 97.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
