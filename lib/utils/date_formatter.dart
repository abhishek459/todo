import 'package:intl/intl.dart';

String dateFormatter(DateTime dateTime) {
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
    return DateFormat('dd-MMM-yyyy').format(dateTime);
  } else if (dateTime.month != DateTime.now().month) {
    return DateFormat('dd MMM').format(dateTime);
  } else if (dateTime.weekday != DateTime.now().weekday) {
    return DateFormat('EEE, dd').format(dateTime);
  } else {
    return DateFormat('dd-MMM-yyyy hh:mm a').format(dateTime);
  }
}
