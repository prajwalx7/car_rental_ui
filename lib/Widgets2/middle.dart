import 'package:car_rental_ui/model/car_model.dart';
import 'package:flutter/material.dart';

class Middle extends StatelessWidget {
  final CarModel car;

  const Middle({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.brand,
                    textScaler: TextScaler.linear(1.0),
                    style: TextStyle(
                        fontSize: 38,
                        color: const Color(0xffCFFA49),
                        letterSpacing: 3.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      car.model,
                      style: TextStyle(color: Colors.white70, fontSize: 22),
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 5),
                      Text(car.rating),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
