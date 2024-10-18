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
                    textScaler: const TextScaler.linear(1.0),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: 'Orbitron',
                          fontSize: 36,
                          color: const Color(0xffCFFA49),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      car.model,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: 'Prompt',
                          fontSize: 22,
                          color: Colors.white70),
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        car.rating,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontFamily: 'Prompt',
                              fontSize: 20,
                            ),
                      ),
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
