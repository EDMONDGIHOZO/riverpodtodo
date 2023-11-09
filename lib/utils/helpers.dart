import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helpers {
  Helpers._();

  static String timeToString(TimeOfDay timeValue) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
          now.year, now.month, now.day, timeValue.hour, timeValue.minute);
      return DateFormat.jm().format(date);
    } catch (e) {
      return "12:00";
    }
  }
}
