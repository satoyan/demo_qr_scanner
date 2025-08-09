import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('y年M月d日(E)', 'ja').format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('H時m分s秒', 'ja').format(dateTime);
  }
}
