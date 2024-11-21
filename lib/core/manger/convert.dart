import 'package:intl/intl.dart';

String convertTimeTo12Hour(String time) {
  DateTime dateTime = DateFormat('HH:mm').parse(time);
  String timeIn12 = DateFormat('hh:mm a').format(dateTime);
  return timeIn12;
}
