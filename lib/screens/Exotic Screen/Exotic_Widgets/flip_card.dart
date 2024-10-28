import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/car_image.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/exotic_bottom.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/exotic_middle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';

class CardFlip extends StatefulWidget {
  final ExoticCarModel car;
  final int index;
  const CardFlip({super.key, required this.car, required this.index});

  @override
  State<CardFlip> createState() => _CardFlipState();
}

class _CardFlipState extends State<CardFlip> {
  final List<FlipCardController> flipControllers = [];
  final List<DateTime?> selectedDates = [];
  List<DateTime?> selectedDate = List<DateTime?>.filled(10, null);

  void _onDateConfirmed(DateTime date) {
    setState(() {
      selectedDates[widget.index] = date;
    });
  }

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < exoticCars.length; i++) {
      flipControllers.add(FlipCardController());
      selectedDates.add(null); // Initialize dates as null for each card
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      rotateSide: RotateSide.left,
      onTapFlipping: false,
      axis: FlipAxis.vertical,
      controller: flipControllers[widget.index],
      frontWidget: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarImage(car: exoticCars[widget.index]),
            ExoticMiddle(car: exoticCars[widget.index]),
            const SizedBox(height: 10),
            ExoticBottom(
              car: exoticCars[widget.index],
              onDateConfirmed: (date) {
                setState(() {
                  // Make sure the selected date is updated correctly
                  selectedDates[widget.index] = date;
                });
                flipControllers[widget.index].flipcard();
              },
            ),
          ],
        ),
      ),
      backWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
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
            CarImage(car: exoticCars[widget.index]),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black.withOpacity(0.1)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rental Details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 18),
                    _buildDetailRow(
                      label: 'Vehicle',
                      value: widget.car.brand,
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      label: 'Model',
                      value: widget.car.model,
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      label: 'Pickup Date',
                      value: selectedDates[widget.index] != null
                          ? '${selectedDates[widget.index]!.day}/${selectedDates[widget.index]!.month}/${selectedDates[widget.index]!.year}'
                          : 'No date selected',
                      isDate: true,
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      label: 'Duration',
                      value: '24-Hour Rental',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      label: 'Status',
                      value: 'Confirmed',
                      isConfirmed: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                flipControllers[widget.index].flipcard();
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
    );
  }
}

Widget _buildDetailRow({
  required String label,
  required String value,
  bool isDate = false,
  bool isConfirmed = false,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Prompt',
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Prompt',
          color: isConfirmed ? Colors.green[400] : Colors.black,
          fontWeight:
              (isDate || isConfirmed) ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ],
  );
}
