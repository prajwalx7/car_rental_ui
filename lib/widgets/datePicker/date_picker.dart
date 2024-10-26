import 'package:car_rental_ui/widgets/datePicker/am_pm.dart';
import 'package:car_rental_ui/widgets/datePicker/day_month_date.dart';
import 'package:car_rental_ui/widgets/datePicker/hours.dart';
import 'package:car_rental_ui/widgets/datePicker/minutes.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const DatePicker({super.key, required this.onDateSelected});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Stack(
        children: [
          // highlighted portion
          Positioned(
            left: 0,
            right: 0,
            top: 100,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                border: const Border(
                  top: BorderSide(color: Color(0xffCFFA49), width: 1),
                  bottom: BorderSide(color: Color(0xffCFFA49), width: 1),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // day month date
              Container(
                width: 150,
                child: ListWheelScrollView.useDelegate(
                  perspective: 0.005,
                  diameterRatio: 1.5,
                  itemExtent: 50,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 365,
                    builder: (context, index) {
                      DateTime currentDate =
                          DateTime.now().add(Duration(days: index));
                      int dayIndex = currentDate.weekday - 1;
                      int monthIndex = currentDate.month - 1;
                      int dateIndex = currentDate.day - 1;
                      bool isToday = index == 0;

                      return DayMonthDate(
                        dayIndex: dayIndex,
                        monthIndex: monthIndex,
                        dateIndex: dateIndex,
                        isToday: isToday,
                      );
                    },
                  ),
                ),
              ),
              // hours
              Container(
                width: 50,
                child: ListWheelScrollView.useDelegate(
                  perspective: 0.005,
                  diameterRatio: 1.5,
                  itemExtent: 50,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 13,
                    builder: (context, index) => Hours(hours: index),
                  ),
                ),
              ),
              // minutes
              Container(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  perspective: 0.005,
                  diameterRatio: 1.5,
                  itemExtent: 50,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 60,
                    builder: (context, index) => Minutes(mins: index),
                  ),
                ),
              ),
              // am: pm
              Container(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  perspective: 0.005,
                  diameterRatio: 1.5,
                  itemExtent: 50,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 2,
                    builder: (context, index) {
                      if (index == 0) {
                        return const AmPm(isAm: true);
                      } else {
                        return const AmPm(isAm: false);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
