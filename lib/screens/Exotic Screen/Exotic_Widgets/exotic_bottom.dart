import 'package:car_rental_ui/model/exotic_car_mode.dart';
import 'package:car_rental_ui/widgets/datePicker/date_picker.dart';
import 'package:flutter/material.dart';

class ExoticBottom extends StatefulWidget {
  final ExoticCarModel car;
  final Function(DateTime) onDateConfirmed;

  const ExoticBottom({
    super.key,
    required this.car,
    required this.onDateConfirmed,
  });

  @override
  State<ExoticBottom> createState() => _ExoticBottomState();
}

class _ExoticBottomState extends State<ExoticBottom> {
  bool isStarred = false;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Rent Price',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontFamily: 'Prompt', fontSize: 18, color: Colors.white),
                ),
                const Spacer(),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '₹ ${widget.car.rate}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontFamily: 'Prompt',
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      TextSpan(
                        text: " /1 Day",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontFamily: 'Prompt',
                            fontSize: 10,
                            color: Colors.white60),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(42),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isStarred = !isStarred;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 22,
                      color: isStarred ? Colors.redAccent : Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                height: 4,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Select Date & Time',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DatePicker(
                                  onDateSelected: (DateTime selectedDateTime) {
                                    selectedDate = selectedDateTime;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (selectedDate != null) {
                                      widget.onDateConfirmed(selectedDate!);

                                      setState(() {});
                                      Navigator.pop(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffCFFA49),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Confirm',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Prompt',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).whenComplete(() {
                      setState(() {});
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xffCFFA49),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Pick a date",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontFamily: 'Prompt',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
