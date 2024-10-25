import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:flutter/material.dart';

class Model extends StatelessWidget {
  final ExoticCarModel car;
  const Model({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          color: Colors.grey.shade300,
          height: 200,
          child: Image.asset(car.imagePath),
        ),
      ),
    );
  }
}
