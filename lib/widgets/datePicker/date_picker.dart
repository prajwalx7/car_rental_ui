import 'dart:async';
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


  late DateTime selectedDate;
  int selectedHour = 0;
  int selectedMinute = 0;
  bool isAm = true;

  
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    selectedDate = today;
  }

  
  void _updateDateTime() {
   
    int hour24 = selectedHour;
    if (!isAm && selectedHour != 12) {
      hour24 += 12;
    } else if (isAm && selectedHour == 12) {
      hour24 = 0;
    }

    DateTime newDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      hour24,
      selectedMinute,
    );

    widget.onDateSelected(newDateTime);
  }


  void _onSelectedItemChanged(VoidCallback callback) {
    
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    
    _debounce = Timer(const Duration(milliseconds: 500), callback);
  }

  @override
  void dispose() {
    _debounce?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Stack(
        children: [
          // Highlighted portion
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
              // Day, month, date
              SizedBox(
                width: 150,
                child: ListWheelScrollView.useDelegate(
                  onSelectedItemChanged: (index) {
                    _onSelectedItemChanged(() {
                      setState(() {
                        selectedDate = DateTime.now().add(Duration(days: index));
                        _updateDateTime();
                      });
                    });
                  },
                  perspective: 0.005,
                  diameterRatio: 1.5,
                  itemExtent: 50,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 365,
                    builder: (context, index) {
                      DateTime currentDate = DateTime.now().add(Duration(days: index));
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
              // Hours
              SizedBox(
                width: 50,
                child: ListWheelScrollView.useDelegate(
                  onSelectedItemChanged: (index) {
                    _onSelectedItemChanged(() {
                      setState(() {
                        selectedHour = index;
                        _updateDateTime();
                      });
                    });
                  },
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
              // Minutes
              SizedBox(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  onSelectedItemChanged: (index) {
                    _onSelectedItemChanged(() {
                      setState(() {
                        selectedMinute = index;
                        _updateDateTime();
                      });
                    });
                  },
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
              // AM/PM
              SizedBox(
                width: 70,
                child: ListWheelScrollView.useDelegate(
                  onSelectedItemChanged: (index) {
                    _onSelectedItemChanged(() {
                      setState(() {
                        isAm = index == 0;
                        _updateDateTime();
                      });
                    });
                  },
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
