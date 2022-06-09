import 'package:intl/intl.dart';

class DateMethods {
  static String dateFormatter(DateTime dateTime) {
    if (dateTime.hour == DateTime.now().hour) {
      int minutes = DateTime.now().difference(dateTime).inMinutes;
      return minutes == 0
          ? 'few seconds ago'
          : (minutes == 1)
              ? '$minutes minute ago'
              : '$minutes minutes ago';
    } else if (dateTime.day == DateTime.now().day) {
      return DateFormat('hh:mm a').format(dateTime);
    } else if (dateTime.year != DateTime.now().year) {
      return DateFormat('d-MMM-yyyy').format(dateTime);
    } else if (dateTime.day != DateTime.now().day) {
      int days = DateTime.now().difference(dateTime).inDays;
      return (days < 7)
          ? DateFormat('EEE - hh:mm a').format(dateTime)
          : (dateTime.month == DateTime.now().month)
              ? DateFormat('EEE, d').format(dateTime)
              : DateFormat('MMM d').format(dateTime);
    } else {
      return DateFormat('d-MMM-yyyy hh:mm a').format(dateTime);
    }
  }

  static String today() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
}
