import 'package:flutter/material.dart';

class DayMonthDate extends StatelessWidget {
  final int dayIndex;
  final int monthIndex;
  final int dateIndex;
  final bool isToday;
  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  final List<String> monthsOfYear = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  DayMonthDate({
    super.key,
    required this.dayIndex,
    required this.monthIndex,
    required this.dateIndex,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    String dayText = daysOfWeek[dayIndex % 7].padLeft(3);
    String monthText = monthsOfYear[monthIndex % 12].padLeft(3);
    String dateText = (dateIndex + 1).toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.only(right: 10, top: 15),
      child: Text(
        isToday ? 'Today'.padLeft(10) : '$dayText $monthText $dateText',
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Orbitron',
        ),
      ),
    );
  }
}

// format :' Thu Oct 24