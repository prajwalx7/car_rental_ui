import 'package:flutter/material.dart';

class Minutes extends StatelessWidget {
  final int mins;
  const Minutes({super.key, required this.mins});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          mins < 10 ? '0' + mins.toString() : mins.toString(),
          style: TextStyle(fontSize: 16, fontFamily: 'Orbitron'),
        ),
      ),
    );
  }
}
