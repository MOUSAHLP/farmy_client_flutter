import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin Formatter {
  static String? formatDateOnly(
    BuildContext context,
    DateTime? date,
  ) {
    if (date == null) return null;
    final DateFormat dateFormat =
        DateFormat.yMMMd(Localizations.localeOf(context).languageCode);
    return dateFormat.format(date.toLocal());
  }

  static String? formatDateOnlyNumbers(
    BuildContext context,
    DateTime? date,
  ) {
    if (date == null) return null;
    final DateFormat dateFormat =
        DateFormat.yMd(Localizations.localeOf(context).languageCode);
    return dateFormat.format(date.toLocal());
  }

  static String? formatHourOnlyAddThreeHours(
    BuildContext context,
    DateTime? date,
  ) {
    if (date == null) return null;

    final DateTime updatedDate = date.add(const Duration(hours: 3));

    final String dateFormat = DateFormat('hh:mm').format(updatedDate);
    return dateFormat;
  }

  static String? formatHourOnly(
    BuildContext context,
    DateTime? date,
  ) {
    if (date == null) return null;
    final String dateFormat = DateFormat('hh:mm').format(date);
    return dateFormat;
  }

  static String formatNumber(dynamic number) {
    final NumberFormat dateFormat = NumberFormat("#,###.#");
    return dateFormat.format(number);
  }

  static Object dateTimeDifference(DateTime dateTimeStart, DateTime dateTimeEnd, String type) {
    if (type == "daily") {
      if (dateTimeEnd.difference(dateTimeStart).inDays == 0) {
        return dateTimeEnd.difference(dateTimeStart).inDays + 1;
      } else {
        return dateTimeEnd.difference(dateTimeStart).inDays + 2;
      }
    }
    return " ${dateTimeEnd.difference(dateTimeStart).inHours.toString()} ";
  }

  static DateTime combineDateTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  static String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final formatter = DateFormat('h:mm', 'en_US');
    return formatter.format(dateTime);
  }

  static bool isCurrentDate(DateTime date) {
    if (!date.isBefore(DateTime.now().subtract(const Duration(days: 1))) &&
        !date.isAfter(DateTime.now())) {
      return true;
    }
    return false;
  }

  static String formatPrice(int price) {
    final formatter = NumberFormat('#,###.##', 'en_US');
    return formatter.format(price);
  }

  static Color hexToColor(String code) {
    // Remove the '#' prefix if present
    if (code.startsWith('#')) {
      code = code.substring(1);
    }

    // Parse the hexadecimal color code
    return Color(int.parse(code, radix: 16) + 0xFF000000);
  }

  static String formatDate(DateTime dateTime) {
    String formattedDate = "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    return formattedDate;
  }
}
