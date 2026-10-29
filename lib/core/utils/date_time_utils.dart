import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  // Date only
  static const String date1 = 'yyyy-MM-dd';
  static const String date2 = 'dd-MM-yyyy';
  static const String date3 = 'MM-dd-yyyy';
  static const String date4 = 'yyyy/MM/dd';
  static const String date5 = 'dd/MM/yyyy';
  static const String date6 = 'MM/dd/yyyy';
  static const String date7 = 'dd MMM yyyy'; //DOB
  static const String date8 = 'd MMM, yyyy';

  // Date + Time
  static const String dateTime1 = 'yyyy-MM-dd HH:mm';
  static const String dateTime2 = 'yyyy-MM-dd HH:mm:ss';
  static const String dateTime3 = 'yyyy/MM/dd HH:mm';
  static const String dateTime4 = 'yyyy/MM/dd HH:mm:ss';
  static const String dateTime5 = 'dd-MM-yyyy HH:mm';
  static const String dateTime6 = 'dd-MM-yyyy HH:mm:ss';
  static const String dateTime7 = 'dd/MM/yyyy HH:mm';
  static const String dateTime8 = 'dd/MM/yyyy HH:mm:ss'; //TransDetails ,
  static const String dateTime9 = 'MMMM d HH:mm';
  static const String dateTime10 = 'MMMM d HH:mm:ss'; //Transaction

  // ISO
  static const String iso1 = "yyyy-MM-dd'T'HH:mm:ss";
  static const String iso2 = "yyyy-MM-dd'T'HH:mm:ss.SSS";

  static const String defaultDateTime = "2026-08-06 09:48:53";

  // Supported Formats List
  static const List<String> supportedFormats = [
    date1,
    date2,
    date3,
    date4,
    date5,
    date6,
    date7,
    date8,
    dateTime1,
    dateTime2,
    dateTime3,
    dateTime4,
    dateTime5,
    dateTime6,
    dateTime7,
    dateTime8,
    dateTime9,
    dateTime10,
    iso1,
    iso2,
  ];

  //change anydate to format
  static String changeDatTimeFormat(String inputDate, String outputFormat) {
    for (final format in supportedFormats) {
      try {
        return DateFormat(
          outputFormat,
        ).format(DateFormat(format).parseStrict(inputDate));
      } catch (_) {}
    }
    return inputDate;
  }

  // format date
  static String formatDate(DateTime date, {String format = date1}) {
    return DateFormat(format).format(date);
  }
}
