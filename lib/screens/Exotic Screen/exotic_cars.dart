import 'package:flutter_flip_card/flutter_flip_card.dart';
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

  final List<FlipCardController> flipControllers = [];
  final List<DateTime?> selectedDates = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < exoticCars.length; i++) {
      flipControllers.add(FlipCardController());
      selectedDates.add(null);
    }
  }

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
            final car = exoticCars[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FlipCard(
                rotateSide: RotateSide.left,
                onTapFlipping: false,
                axis: FlipAxis.vertical,
                controller: flipControllers[index],
                frontWidget: Container(
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
                      ExoticBottom(
                        car: exoticCars[index],
                        onDateConfirmed: (date) {
                          setState(() {
                            selectedDates[index] = date;
                          });
                          flipControllers[index].flipcard();
                        },
                      ),
                    ],
                  ),
                ),
                backWidget: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Booking Confirmed',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Prompt',
                          color: Colors.black,
                        ),
                      ),
                      CarImage(car: exoticCars[index]),
                      const Text(
                        'Booking Details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Prompt',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Your ${car.brand}  ${car.model} will be delivered to your address',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Prompt',
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        selectedDates[index] != null
                            ? '${selectedDates[index]!.day}/${selectedDates[index]!.month}/${selectedDates[index]!.year}'
                            : 'No date selected',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Prompt',
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          flipControllers[index].flipcard();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffCFFA49),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Back to Car',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Prompt',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
