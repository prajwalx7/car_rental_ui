import 'package:flutter/material.dart';

class AmPm extends StatelessWidget {
  final bool isAm;
  const AmPm({super.key, required this.isAm});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        isAm == true ? 'am' : 'pm',
        style: TextStyle(fontSize: 16, fontFamily: 'Orbitron'),
      )),
    );
  }
}
