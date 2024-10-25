import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/exotic_bottom.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/exotic_middle.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/car_image.dart';
import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:flutter/material.dart';

class ExoticCars extends StatefulWidget {
  final ExoticCarModel car;

  const ExoticCars({
    super.key,
    required this.car,
  });

  @override
  State<ExoticCars> createState() => _ExoticCarsState();
}

class _ExoticCarsState extends State<ExoticCars> {
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff06090D),
      appBar: AppBar(
        title: const Text(
          "Exotic Cars",
          style: TextStyle(
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CarImage(car: exoticCars[index]),
                    ExoticMiddle(car: exoticCars[index]),
                    const SizedBox(height: 10),
                    ExoticBottom(car: exoticCars[index]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
