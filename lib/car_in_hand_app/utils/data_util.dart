import 'package:intl/intl.dart';

class DataUtil {
  static int convertDateTimeInTimespace(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  static DateTime convertTimespaceInDateTime(int dateTimespace) {
    return DateTime.fromMillisecondsSinceEpoch(dateTimespace);
  }

  static DateTime? convertStringToDateTimeOrNull(String? date) {
    return date != null ? DateTime.parse(date) : null;
  }

  static bool verifyDateTimeNotNull(DateTime? date) {
    return date != null ? true : false;
  }

  static DateTime? verifyDateTimeOrNull(DateTime? date) {
    return verifyDateTimeNotNull(date) ? date : null;
  }

  static String formatDateyyyyMMddHHmmssString(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }
}
