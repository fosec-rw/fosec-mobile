import 'package:intl/intl.dart';

String format_time(int unixTimestamp) {
  // Convert the UNIX timestamp (in seconds) to DateTime
  DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);

  // Use intl package to format time in a readable format (e.g., 6:45 AM)
  return DateFormat('hh:mm a').format(date);  // Example: 06:45 AM
}
