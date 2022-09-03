class ConvertDate {
  int convertDateTimeInTimespace(DateTime date) {
    return date.millisecondsSinceEpoch;
  }

  DateTime convertTimespaceInDateTime(int dateTimespace) {
    return DateTime.fromMillisecondsSinceEpoch(dateTimespace);
  }
}
