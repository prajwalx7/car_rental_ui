import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExoticMiddle extends StatelessWidget {
  final ExoticCarModel car;
  const ExoticMiddle({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          car.brand,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontFamily: 'Orbitron',
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          car.model,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontFamily: 'Prompt', fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSpecifications('assets/svg/speed.svg', "Max Speed",
                '${car.maxspeed} Km/h', context),
            Container(
              height: 80,
              width: 1,
              decoration: const BoxDecoration(
                color: Colors.white70,
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.transparent
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            buildSpecifications(
                'assets/svg/engine.svg', "Engine", car.engine, context),
            Container(
              height: 80,
              width: 1,
              decoration: const BoxDecoration(
                color: Colors.white70,
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.transparent
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            buildSpecifications(
                'assets/svg/seats.svg', "Seats", car.seats, context),
          ],
        ),
      ],
    );
  }
}

Widget buildSpecifications(
    String svgPath, String text, String speed, BuildContext context) {
  return Column(
    children: [
      SvgPicture.asset(
        svgPath,
        height: 25,
        width: 25,
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: 'Prompt', fontSize: 16, color: Colors.black87),
      ),
      const SizedBox(height: 8),
      Text(
        speed,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: 'Orbitron',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}
