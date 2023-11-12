// import 'package:flutter/material.dart';
//
// import 'color_manager.dart';
//
// final timePickerTheme = TimePickerThemeData(
//   backgroundColor: Colors.white,
//   hourMinuteShape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(8)),
//     side: BorderSide(color: ColorManager.primaryColor, width: 4),
//   ),
//   dayPeriodBorderSide: const BorderSide(color: ColorManager.primaryColor, width: 4),
//   dayPeriodColor: ColorManager.lightPrimaryColor,
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(8)),
//     side: BorderSide(color:  ColorManager.primaryColor, width: 4),
//   ),
//   dayPeriodTextColor: Colors.white,
//   dayPeriodShape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(8)),
//     side: BorderSide(color:  ColorManager.primaryColor, width: 4),
//   ),
//   hourMinuteColor: MaterialStateColor.resolveWith((states) =>
//   states.contains(MaterialState.selected) ?  ColorManager.primaryColor : Colors.white),
//   hourMinuteTextColor: MaterialStateColor.resolveWith(
//           (states) => states.contains(MaterialState.selected) ? Colors.white :  ColorManager.primaryColor),
//   dialHandColor: Colors.white,
//   dialBackgroundColor: ColorManager.lightPrimaryColor,
//   hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//   dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//   helpTextStyle:
//   const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
//   inputDecorationTheme: const InputDecorationTheme(
//     border: InputBorder.none,
//     contentPadding: EdgeInsets.all(0),
//   ),
//   dialTextColor: MaterialStateColor.resolveWith(
//           (states) => states.contains(MaterialState.selected) ?  ColorManager.primaryColor : Colors.white),
//   entryModeIconColor: ColorManager.primaryColor,
// );
// final datePickerTheme = DatePickerThemeData(
//   backgroundColor: Colors.white,
// headerBackgroundColor: ColorManager.lightPrimaryColor,
//   headerForegroundColor: Colors.white,
//   rangePickerSurfaceTintColor: Colors.red,
//   todayBackgroundColor: MaterialStateProperty.all(ColorManager.lightPrimaryColor),
//   todayForegroundColor:  MaterialStateProperty.all(Colors.white),
//
// );