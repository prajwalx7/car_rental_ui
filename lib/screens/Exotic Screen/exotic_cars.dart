import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/exotic_bottom.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/exotic_middle.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/car_image.dart';
import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  final List<FlipCardController> flipControllers = [];
  final List<DateTime?> selectedDates = [];

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'No date selected';
    
    final date = DateFormat('EEEE, MMMM d, y').format(dateTime);
    final time = DateFormat('h:mm a').format(dateTime);
    
    return '$date\n$time';
  }

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
            fontSize: 26, 
            fontWeight: FontWeight.w500, 
            fontFamily: 'Prompt'
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        child: Text(
                          _formatDateTime(selectedDates[index]),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Prompt',
                            color: Colors.black,
                            height: 1.5,
                          ),
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
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Back to Car',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Prompt',
                            color: Color(0xff06090D),
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

