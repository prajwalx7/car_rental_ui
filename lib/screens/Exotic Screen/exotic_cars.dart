import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/flip_card.dart';
import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:flutter/material.dart';

class ExoticCars extends StatefulWidget {
  final ExoticCarModel car;
  final DateTime? selectedDateTime;

  const ExoticCars({
    super.key,
    required this.car,
    this.selectedDateTime,
  });

  @override
  State<ExoticCars> createState() => _ExoticCarsState();
}

class _ExoticCarsState extends State<ExoticCars> {
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 1,
  );

  bool isFlipped = false;

  void updateFlipState(bool flipped) {
    setState(() {
      isFlipped = !flipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06090D),
      appBar: AppBar(
        title: Text(
          isFlipped ? "Booking Confirm" : "Exotic Cars",
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.w500, fontFamily: 'Prompt'),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff06090D),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: PageView.builder(
          controller: _pageController,
          itemCount: exoticCars.length,
          itemBuilder: (context, index) {
            final car = exoticCars[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CardFlip(car: car, index: index, onFlip: updateFlipState),
            );
          },
        ),
      ),
    );
  }
}
