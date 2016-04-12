import 'package:intl/intl.dart';

class DateFormatter {
  String formatDate(int millisecondsSinceEpoch){
    var date = new DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    var formatter = new DateFormat('dd.MM.yyyy hh:mm');
    return formatter.format(date);
  }
}