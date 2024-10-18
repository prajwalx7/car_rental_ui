import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme get customTextTheme {
    return TextTheme(
      displaySmall: const TextStyle(
        fontFamily: 'Orbitron',
        fontWeight: FontWeight.normal,
      ).copyWith(
        color: const Color(0xffCFFA49),
      ),
    );
  }
}
