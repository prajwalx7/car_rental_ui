import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/car_image.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/exotic_bottom.dart';
import 'package:car_rental_ui/screens/Exotic%20Screen/Exotic_Widgets/exotic_middle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:intl/intl.dart';

class CardFlip extends StatefulWidget {
  final ExoticCarModel car;
  final int index;
  final DateTime? selectedDateTime;
  final Function(bool) onFlip;
  const CardFlip({
    super.key,
    required this.car,
    required this.index,
    this.selectedDateTime,
    required this.onFlip,
  });

  @override
  State<CardFlip> createState() => _CardFlipState();
}

class _CardFlipState extends State<CardFlip> {
  final List<FlipCardController> flipControllers = [];
  final List<DateTime?> selectedDates = [];

  String _formatDate(DateTime? dateTime) {
    if (dateTime == null) return 'No date selected';

    final date = DateFormat('EE MMM d').format(dateTime);

    return date;
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return 'No time selected';

    final time = DateFormat('h:mm a').format(dateTime);

    return time;
  }

  String _calculateDropOffTime(DateTime? pickupDateTime) {
    if (pickupDateTime == null) return 'No time selected';

    final dropOffDateTime = pickupDateTime.add(const Duration(hours: 24));
    final time = DateFormat('h:mm a').format(dropOffDateTime);
    final date = DateFormat('EE MMM d').format(dropOffDateTime);

    return '$time ($date)';
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
    return FlipCard(
      animationDuration: Duration(milliseconds: 800),
      rotateSide: RotateSide.left,
      onTapFlipping: false,
      axis: FlipAxis.vertical,
      controller: flipControllers[widget.index],
      frontWidget: Container(
        margin: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarImage(car: exoticCars[widget.index]),
            const SizedBox(height: 10),
            ExoticMiddle(car: exoticCars[widget.index]),
            const SizedBox(height: 15),
            ExoticBottom(
              car: exoticCars[widget.index],
              onDateConfirmed: (date) {
                setState(() {
                  selectedDates[widget.index] = date;
                });
                widget.onFlip(false);
                flipControllers[widget.index].flipcard();
              },
            ),
          ],
        ),
      ),
      backWidget: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarImage(car: exoticCars[widget.index]),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black.withOpacity(0.1)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rental Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildDetailRow(
                      label: 'Vehicle',
                      value: widget.car.brand,
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      label: 'Model',
                      value: widget.car.model,
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      label: 'Pickup Date',
                      value: _formatDate(selectedDates[widget.index]),
                      isDate: true,
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      label: 'Pickup Time',
                      value: _formatTime(selectedDates[widget.index]),
                      isDate: true,
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      label: 'Drop-off Time',
                      value: _calculateDropOffTime(selectedDates[widget.index]),
                      isDate: true,
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      label: 'Duration',
                      value: '24-Hour Rental',
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      label: 'Status',
                      value: 'Confirmed',
                      isConfirmed: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () {
                widget.onFlip(true);
                flipControllers[widget.index].flipcard();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffCFFA49),
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              label: const Text(
                'Back to Car',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Prompt',
                ),
              ),
            ),
            SizedBox(height: 10),
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
        style: const TextStyle(
          fontSize: 15,
          fontFamily: 'Prompt',
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Prompt',
          color: isConfirmed ? Colors.green[400] : Colors.black,
          fontWeight:
              (isDate || isConfirmed) ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ],
  );
}
