import 'package:intl/intl.dart';

final DateTime today = DateTime.now();
final DateTime current = DateTime(today.year, today.month, today.day);
final DateTime tomorrow = current.add(Duration(days: 1));
final DateTime trial = current.add(Duration(days: 1));
final DateTime before7Days = current.subtract(Duration(days: 7));
final DateTime before30Days = current.subtract(Duration(days: 30));
final DateTime before90Days = current.subtract(Duration(days: 90));
final DateTime past1000Days = current.add(Duration(days: 1000));

// Calculation for 07:30 pm
final Duration difference = tomorrow.difference(today);
final DateTime leastPermittedDate =
    difference.inMinutes >= 270 ? tomorrow : tomorrow.add(Duration(days: 1));

final DateFormat formatter = DateFormat('yyyy-MM-dd');

final String todayFormat = formatter.format(today);
final String before7DaysFormat = formatter.format(before7Days);
final String before30DaysFormat = formatter.format(before30Days);
final String before90DaysFormat = formatter.format(before90Days);
final String past1000DaysFormat = formatter.format(past1000Days);
