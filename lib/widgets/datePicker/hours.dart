import 'package:flutter/material.dart';

class Hours extends StatelessWidget {
  final int hours;
  const Hours({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          hours.toString(),
          style: TextStyle(fontSize: 16, fontFamily: 'Orbitron'),
        ),
      ),
    );
  }
}
