import 'package:intl/intl.dart';

class CustomDateUtils {
  static String formatLastUpdateDate(DateTime date) {
    return DateFormat('EEEE, MMMM d, h:mm a').format(date);
  }

  static String formatAppointmentDate(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date, true);
    String resultFormat = "";
    if (tempDate.day == DateTime.now().day) {
      resultFormat = "'Today,' h:mm a";
    } else {
      resultFormat = "EEEE, MMMM d, h:mm a";
    }
    return DateFormat(resultFormat).format(tempDate.toLocal());
  }

  static DateTime formatAppointmentDateToMillis(String date) {
    return DateFormat("yyyy-MM-ddThh:mm:ss").parse(date, true);
  }

  static String formatSendVisitTime(int date) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss")
        .format(DateTime.fromMillisecondsSinceEpoch(date, isUtc: true));
  }

  static String formatSendVisitDate(int date) {
    return DateFormat("MM/dd/yyyy")
        .format(DateTime.fromMillisecondsSinceEpoch(date, isUtc: true));
  }

  static String formatDOB(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date);
    return DateFormat("dd.MM.yyyy").format(tempDate);
  }

  static String formatDateTime(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date);
    return DateFormat("MM/dd/yyyy").format(tempDate);
  }

  static String formatTimeFromMillis(int time) {
    return DateFormat('h:mm a')
        .format(DateTime.fromMillisecondsSinceEpoch(time));
  }

  static String formatOfflineDate(String date) {
    DateFormat format1 = DateFormat("MM/dd/yyyy h:m:s a");
    return DateFormat('yyyy-MM-ddThh:mm:ss').format(format1.parse(date));
  }
}
