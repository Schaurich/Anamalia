import 'package:intl/intl.dart';

class DateHelper {
  static String getDateToString(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String getHourToString(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  static String getFormattedDateTimeToString(DateTime date) {
    return DateFormat('dd/MM/yyyy - HH:mm').format(date);
  }

  static String getDateToFormattedString(DateTime? date) {
    if (date == null) {
      return '__/__/__';
    }
    final day = date.day;
    final month = date.month;
    final year = date.year;

    return '$day/$month/$year';
  }
}
