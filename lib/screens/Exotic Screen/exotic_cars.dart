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
  bool isAnimating = false;
  String currentTitle = "Exotic Cars";

  void updateFlipState(bool flipped) {
    setState(() {
      isAnimating = true;
      // Delay the title change to match the card flip animation
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          isFlipped = !flipped;
          currentTitle = isFlipped ? "Booking Confirm" : "Exotic Cars";
        });
      });
      // Reset the animation flag after the complete animation cycle
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          isAnimating = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06090D),
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Text(
            currentTitle,
            key: ValueKey<String>(currentTitle),
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              fontFamily: 'Prompt',
            ),
          ),
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
